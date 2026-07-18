import 'dart:ui';

import 'package:flutter_grpc_starter/core/session/session_manager.dart';
import 'package:flutter_grpc_starter/services/device/device_info.dart';
import 'package:grpc/grpc.dart';

typedef LocaleResolver = String? Function();

const grpcPublicMethods = <String>{
  '/auth.v1.AuthService/Login',
  '/auth.v1.AuthService/Register',
  '/auth.v1.AuthService/RefreshToken',
  '/auth.v1.AuthService/VerifyEmail',
  '/auth.v1.AuthService/RequestPasswordReset',
  '/auth.v1.AuthService/ResetPassword',
  '/health.v1.HealthService/Check',
  '/health.v1.HealthService/Ready',
};

MetadataProvider authMetadataProvider(SessionManager session) =>
    (metadata, uri) async {
      if (grpcPublicMethods.contains(uri)) return;
      final token = await session.validAccessToken();
      if (token != null) metadata['authorization'] = 'Bearer $token';
    };

MetadataProvider localeMetadataProvider(LocaleResolver? resolver) =>
    (metadata, uri) {
      metadata['accept-language'] =
          resolver?.call() ??
          PlatformDispatcher.instance.locale.toLanguageTag();
    };

MetadataProvider clientInfoMetadataProvider(DeviceInfo info) =>
    (metadata, uri) {
      metadata['x-app-version'] = info.appVersion;
      metadata['x-build-number'] = info.buildNumber;
      metadata['x-platform'] = info.platform;
      metadata['x-os-version'] = info.osVersion;
      metadata['x-device-id'] = info.deviceId;
    };
