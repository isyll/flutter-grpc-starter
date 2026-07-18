import 'dart:convert';

import 'package:flutter_grpc_starter/core/logging/app_logger.dart';
import 'package:flutter_grpc_starter/features/app_update/domain/app_version.dart';
import 'package:flutter_grpc_starter/services/device/device_info.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_update/in_app_update.dart';

Future<void> runAndroidInAppUpdate() async {
  final info = await InAppUpdate.checkForUpdate();
  if (info.updateAvailability != .updateAvailable) return;

  if (info.flexibleUpdateAllowed) {
    final result = await InAppUpdate.startFlexibleUpdate();
    if (result == .success) {
      await InAppUpdate.completeFlexibleUpdate();
    }
  } else if (info.immediateUpdateAllowed) {
    await InAppUpdate.performImmediateUpdate();
  }
}

typedef PlatformUpdateRunner = Future<void> Function();

class AppUpdateService {
  AppUpdateService({
    required this._deviceInfo,
    http.Client? httpClient,
    PlatformUpdateRunner? androidUpdateRunner,
    this._logger = const .new('AppUpdateService'),
  }) : _httpClient = httpClient ?? http.Client(),
       _androidUpdateRunner = androidUpdateRunner ?? runAndroidInAppUpdate;

  static const appStoreLookupBaseUrl = 'https://itunes.apple.com';
  final DeviceInfo _deviceInfo;
  final http.Client _httpClient;
  final PlatformUpdateRunner _androidUpdateRunner;

  final AppLogger _logger;

  Future<String?> check() => switch (_deviceInfo.platform) {
    'android' => _runAndroidUpdate(),
    'ios' => _newerAppStoreVersion(),
    _ => .value(),
  };

  Future<String?> _newerAppStoreVersion() async {
    try {
      final uri = Uri.parse('$appStoreLookupBaseUrl/lookup').replace(
        queryParameters: {'bundleId': _deviceInfo.bundleId},
      );
      final response = await _httpClient.get(uri);
      if (response.statusCode != 200) {
        _logger.warning(
          'App Store version check failed (${response.statusCode})',
        );
        return null;
      }

      final version = _readStoreVersion(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      return version != null && isVersionNewer(version, _deviceInfo.appVersion)
          ? version
          : null;
    } on Object catch (error) {
      _logger.warning('App Store version check failed', error);
      return null;
    }
  }

  Future<String?> _runAndroidUpdate() async {
    try {
      await _androidUpdateRunner();
    } on Object catch (error) {
      _logger.warning('Android in-app update skipped', error);
    }
    return null;
  }

  static String? _readStoreVersion(Map<String, dynamic>? data) {
    final results = data?['results'];
    if (results is List && results.isNotEmpty) {
      final entry = results.first;
      if (entry is Map && entry['version'] is String) {
        return entry['version'] as String;
      }
    }
    return null;
  }
}
