import 'package:flutter_grpc_starter/core/network/grpc_metadata.dart';
import 'package:flutter_grpc_starter/core/session/auth_tokens.dart';
import 'package:flutter_grpc_starter/core/session/session_manager.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fakes.dart';

void main() {
  group('authMetadataProvider', () {
    late SessionManager session;

    setUp(() {
      session = SessionManager(
        storage: InMemorySecureStorage(),
        refresher: unexpectedRefresh,
      );
    });

    tearDown(() => session.dispose());

    test('attaches a bearer token to authenticated calls', () async {
      await session.start(
        AuthTokens(
          accessToken: 'token-123',
          refreshToken: 'refresh',
          expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
        ),
      );
      final provider = authMetadataProvider(session);
      final metadata = <String, String>{};

      await provider(metadata, '/user.v1.UserService/GetMe');

      expect(metadata['authorization'], 'Bearer token-123');
    });

    test('skips public methods', () async {
      await session.start(
        AuthTokens(
          accessToken: 'token-123',
          refreshToken: 'refresh',
          expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
        ),
      );
      final provider = authMetadataProvider(session);
      final metadata = <String, String>{};

      await provider(metadata, '/auth.v1.AuthService/Login');

      expect(metadata.containsKey('authorization'), isFalse);
    });

    test('adds nothing when there is no session', () async {
      final provider = authMetadataProvider(session);
      final metadata = <String, String>{};

      await provider(metadata, '/user.v1.UserService/GetMe');

      expect(metadata, isEmpty);
    });
  });

  test('localeMetadataProvider uses the resolver value', () async {
    final provider = localeMetadataProvider(() => 'fr');
    final metadata = <String, String>{};

    await provider(metadata, '/user.v1.UserService/GetMe');

    expect(metadata['accept-language'], 'fr');
  });

  test('clientInfoMetadataProvider stamps device headers', () async {
    final provider = clientInfoMetadataProvider(testDeviceInfo);
    final metadata = <String, String>{};

    await provider(metadata, '/user.v1.UserService/GetMe');

    expect(metadata['x-app-version'], '1.2.3');
    expect(metadata['x-build-number'], '42');
    expect(metadata['x-platform'], 'android');
    expect(metadata['x-os-version'], '15');
    expect(metadata['x-device-id'], 'test-device-id');
  });
}
