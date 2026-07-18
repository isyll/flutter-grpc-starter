import 'dart:convert';

import 'package:flutter_grpc_starter/features/app_update/data/app_update_service.dart';
import 'package:flutter_grpc_starter/services/device/device_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../../helpers/fakes.dart';

void main() {
  AppUpdateService buildService({
    required DeviceInfo deviceInfo,
    http.Client? httpClient,
    PlatformUpdateRunner? androidUpdateRunner,
  }) => .new(
    deviceInfo: deviceInfo,
    httpClient: httpClient ?? MockClient((_) async => http.Response('{}', 200)),
    androidUpdateRunner: androidUpdateRunner,
  );

  MockClient lookupReturning(
    Map<String, dynamic> body, {
    int statusCode = 200,
  }) => .new((_) async => http.Response(jsonEncode(body), statusCode));

  group('iOS', () {
    test('returns the store version when it is newer', () async {
      final service = buildService(
        deviceInfo: iosDeviceInfo,
        httpClient: lookupReturning(const {
          'resultCount': 1,
          'results': [
            {'version': '2.0.0'},
          ],
        }),
      );

      expect(await service.check(), '2.0.0');
    });

    test('returns null when the installed version is current', () async {
      final service = buildService(
        deviceInfo: iosDeviceInfo,
        httpClient: lookupReturning(const {
          'results': [
            {'version': '1.2.3'},
          ],
        }),
      );

      expect(await service.check(), isNull);
    });

    test('returns null and swallows lookup failures', () async {
      final service = buildService(
        deviceInfo: iosDeviceInfo,
        httpClient: lookupReturning(const {}, statusCode: 500),
      );

      expect(await service.check(), isNull);
    });
  });

  group('Android', () {
    test('runs the native flow and returns null', () async {
      var ran = false;
      final service = buildService(
        deviceInfo: testDeviceInfo,
        androidUpdateRunner: () async => ran = true,
      );

      expect(await service.check(), isNull);
      expect(ran, isTrue);
    });

    test('swallows native update failures', () async {
      final service = buildService(
        deviceInfo: testDeviceInfo,
        androidUpdateRunner: () async => throw Exception('not owned by Play'),
      );

      expect(await service.check(), isNull);
    });
  });
}
