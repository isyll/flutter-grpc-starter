import 'dart:async';

import 'package:flutter_grpc_starter/core/error/app_exception.dart';
import 'package:flutter_grpc_starter/core/logging/app_logger.dart';
import 'package:flutter_grpc_starter/core/session/auth_tokens.dart';
import 'package:flutter_grpc_starter/core/storage/secure_storage.dart';
import 'package:flutter_grpc_starter/core/storage/storage_keys.dart';

typedef TokenRefresher = Future<AuthTokens> Function(String refreshToken);

final class SessionManager {
  SessionManager({
    required this._storage,
    required this._refresher,
    this._logger = const .new('SessionManager'),
  });

  final SecureStorage _storage;
  final TokenRefresher _refresher;
  final AppLogger _logger;

  final _statusController = StreamController<SessionStatus>.broadcast();

  AuthTokens? _tokens;
  SessionStatus _status = .unknown;
  Future<String?>? _pendingRefresh;

  String? get accessToken => _tokens?.accessToken;

  bool get hasValidAccessToken {
    final tokens = _tokens;
    return tokens != null && !tokens.isExpired;
  }

  SessionStatus get status => _status;

  Stream<SessionStatus> get statusStream => _statusController.stream;

  void dispose() => unawaited(_statusController.close());

  Future<void> end() async {
    _tokens = null;
    await _storage.delete(StorageKeys.accessToken);
    await _storage.delete(StorageKeys.refreshToken);
    await _storage.delete(StorageKeys.accessTokenExpiry);

    if (await _tokensStillPersisted()) {
      _logger.warning('Token deletion incomplete, clearing secure storage');
      await _storage.deleteAll();
    }

    _setStatus(.none);
  }

  Future<String?> refreshAccessToken() {
    final pending = _pendingRefresh;
    if (pending != null) return pending;

    final refresh = _performRefresh().whenComplete(
      () => _pendingRefresh = null,
    );
    _pendingRefresh = refresh;
    return refresh;
  }

  Future<void> restore() async {
    final accessToken = await _storage.read(StorageKeys.accessToken);
    final refreshToken = await _storage.read(StorageKeys.refreshToken);

    if (accessToken == null || refreshToken == null) {
      _setStatus(.none);
      return;
    }

    final expiryRaw = await _storage.read(StorageKeys.accessTokenExpiry);
    _tokens = .new(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiryRaw == null ? null : .tryParse(expiryRaw),
    );
    _setStatus(.active);
  }

  Future<void> start(AuthTokens tokens) async {
    _tokens = tokens;
    await _persist(tokens);
    _setStatus(.active);
  }

  Future<String?> validAccessToken() {
    final tokens = _tokens;
    if (tokens == null) return .value();
    if (!tokens.isExpired) return .value(tokens.accessToken);

    _logger.debug('Access token expired, refreshing before request');
    return refreshAccessToken();
  }

  Future<String?> _performRefresh() async {
    final refreshToken = _tokens?.refreshToken;
    if (refreshToken == null) {
      await end();
      return null;
    }

    try {
      final tokens = await _refresher(refreshToken);
      _tokens = tokens;
      await _persist(tokens);
      _logger.info('Access token refreshed');
      return tokens.accessToken;
    } on UnauthorizedException catch (error) {
      _logger.warning('Refresh token rejected, ending session', error);
      await end();
      return null;
    } on ValidationException catch (error) {
      _logger.warning('Refresh token invalid, ending session', error);
      await end();
      return null;
    } on AppException catch (error) {
      _logger.warning('Token refresh failed transiently', error);
      return null;
    } on Object catch (error) {
      _logger.error('Unexpected error refreshing token', error);
      return null;
    }
  }

  Future<void> _persist(AuthTokens tokens) async {
    await _storage.write(StorageKeys.accessToken, tokens.accessToken);
    await _storage.write(StorageKeys.refreshToken, tokens.refreshToken);
    final expiresAt = tokens.expiresAt;
    if (expiresAt != null) {
      await _storage.write(
        StorageKeys.accessTokenExpiry,
        expiresAt.toIso8601String(),
      );
    } else {
      await _storage.delete(StorageKeys.accessTokenExpiry);
    }
  }

  void _setStatus(SessionStatus value) {
    if (_status == value) return;
    _status = value;
    _statusController.add(value);
  }

  Future<bool> _tokensStillPersisted() async {
    return await _storage.containsKey(StorageKeys.accessToken) ||
        await _storage.containsKey(StorageKeys.refreshToken);
  }
}

enum SessionStatus { unknown, active, none }
