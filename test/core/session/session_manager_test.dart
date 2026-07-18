import 'dart:async';

import 'package:flutter_grpc_starter/core/error/app_exception.dart';
import 'package:flutter_grpc_starter/core/session/auth_tokens.dart';
import 'package:flutter_grpc_starter/core/session/session_manager.dart';
import 'package:flutter_grpc_starter/core/storage/storage_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fakes.dart';

void main() {
  late InMemorySecureStorage storage;

  setUp(() => storage = .new());

  SessionManager buildManager({TokenRefresher? refresher}) => .new(
    storage: storage,
    refresher: refresher ?? unexpectedRefresh,
  );

  AuthTokens freshTokens() => .new(
    accessToken: 'fresh-access',
    refreshToken: 'fresh-refresh',
    expiresAt: .now().toUtc().add(const .new(hours: 1)),
  );

  AuthTokens tokensExpiringIn(Duration duration) => .new(
    accessToken: 'access',
    refreshToken: 'refresh',
    expiresAt: .now().toUtc().add(duration),
  );

  group('restore', () {
    test('ends up signed out when nothing is stored', () async {
      final manager = buildManager();

      await manager.restore();

      expect(manager.status, SessionStatus.none);
      expect(manager.accessToken, isNull);
    });

    test('restores a persisted session with its expiry', () async {
      storage.values.addAll({
        StorageKeys.accessToken: 'stored-access',
        StorageKeys.refreshToken: 'stored-refresh',
        StorageKeys.accessTokenExpiry: '2020-01-01T00:00:00.000Z',
      });
      final manager = buildManager();

      await manager.restore();

      expect(manager.status, SessionStatus.active);
      expect(manager.accessToken, 'stored-access');
      expect(manager.hasValidAccessToken, isFalse);
    });
  });

  group('start and end', () {
    test('start persists tokens and activates the session', () async {
      final manager = buildManager();

      await manager.start(tokensExpiringIn(const .new(hours: 1)));

      expect(manager.status, SessionStatus.active);
      expect(storage.values[StorageKeys.accessToken], 'access');
      expect(storage.values[StorageKeys.refreshToken], 'refresh');
      expect(storage.values[StorageKeys.accessTokenExpiry], isNotNull);
    });

    test('end wipes tokens and deactivates the session', () async {
      final manager = buildManager();
      await manager.start(tokensExpiringIn(const .new(hours: 1)));

      await manager.end();

      expect(manager.status, SessionStatus.none);
      expect(storage.values, isEmpty);
    });
  });

  group('validAccessToken', () {
    test('returns the current token without refreshing when valid', () async {
      final manager = buildManager();
      await manager.start(tokensExpiringIn(const .new(hours: 1)));

      final token = await manager.validAccessToken();

      expect(token, 'access');
    });

    test('refreshes an expired token before returning it', () async {
      var refreshCalls = 0;
      final manager = buildManager(
        refresher: (_) async {
          refreshCalls++;
          return freshTokens();
        },
      );
      await manager.start(tokensExpiringIn(const .new(minutes: -5)));

      final token = await manager.validAccessToken();

      expect(token, 'fresh-access');
      expect(refreshCalls, 1);
      expect(storage.values[StorageKeys.accessToken], 'fresh-access');
      expect(storage.values[StorageKeys.refreshToken], 'fresh-refresh');
    });
  });

  group('refreshAccessToken', () {
    test('deduplicates concurrent refreshes into one call', () async {
      final gate = Completer<void>();
      var refreshCalls = 0;
      final manager = buildManager(
        refresher: (_) async {
          refreshCalls++;
          await gate.future;
          return freshTokens();
        },
      );
      await manager.start(tokensExpiringIn(const .new(minutes: -5)));

      final first = manager.refreshAccessToken();
      final second = manager.refreshAccessToken();
      gate.complete();
      final results = await Future.wait([first, second]);

      expect(results, ['fresh-access', 'fresh-access']);
      expect(refreshCalls, 1);
    });

    test('ends the session when the refresh token is rejected', () async {
      final manager = buildManager(
        refresher: (_) async => throw unauthorizedFailure(),
      );
      await manager.start(tokensExpiringIn(const .new(minutes: -5)));

      final token = await manager.refreshAccessToken();

      expect(token, isNull);
      expect(manager.status, SessionStatus.none);
      expect(storage.values, isEmpty);
    });

    test('keeps the session alive on transient refresh failures', () async {
      final manager = buildManager(
        refresher: (_) async =>
            throw const NetworkException('offline', kind: .offline),
      );
      await manager.start(tokensExpiringIn(const .new(minutes: -5)));

      final token = await manager.refreshAccessToken();

      expect(token, isNull);
      expect(manager.status, SessionStatus.active);
      expect(storage.values[StorageKeys.refreshToken], 'refresh');
    });
  });
}
