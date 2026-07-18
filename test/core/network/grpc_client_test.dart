import 'package:flutter_grpc_starter/core/error/app_exception.dart';
import 'package:flutter_grpc_starter/core/network/grpc_client.dart';
import 'package:flutter_grpc_starter/core/session/auth_tokens.dart';
import 'package:flutter_grpc_starter/core/session/session_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';

import '../../helpers/fakes.dart';

void main() {
  late ClientChannel channel;

  setUp(() {
    channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  });

  tearDown(() => channel.shutdown());

  AuthTokens activeTokens() => AuthTokens(
    accessToken: 'access',
    refreshToken: 'refresh',
    expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
  );

  GrpcClient buildClient(SessionManager session) => GrpcClient(
    channel: channel,
    session: session,
    deviceInfo: testDeviceInfo,
  );

  test('run returns a success result', () async {
    final session = SessionManager(
      storage: InMemorySecureStorage(),
      refresher: unexpectedRefresh,
    );
    addTearDown(session.dispose);

    final result = await buildClient(session).run<int>(() async => 7);

    expect(result.valueOrNull, 7);
  });

  test('run maps a GrpcError into an AppException failure', () async {
    final session = SessionManager(
      storage: InMemorySecureStorage(),
      refresher: unexpectedRefresh,
    );
    addTearDown(session.dispose);

    final result = await buildClient(session).run<int>(
      () async => throw const GrpcError.unavailable('down'),
    );

    expect(result.isSuccess, isFalse);
    expect(result.exceptionOrNull, isA<NetworkException>());
  });

  test('call retries once after refreshing on unauthenticated', () async {
    final refreshed = AuthTokens(
      accessToken: 'fresh',
      refreshToken: 'refresh2',
      expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
    );
    final session = SessionManager(
      storage: InMemorySecureStorage(),
      refresher: (_) async => refreshed,
    );
    addTearDown(session.dispose);
    await session.start(activeTokens());

    var attempts = 0;
    final value = await buildClient(session).call<String>(() async {
      attempts++;
      if (attempts == 1) throw const GrpcError.unauthenticated('expired');
      return 'ok';
    });

    expect(value, 'ok');
    expect(attempts, 2);
    expect(session.accessToken, 'fresh');
  });

  test('call does not retry without an active session', () async {
    final session = SessionManager(
      storage: InMemorySecureStorage(),
      refresher: unexpectedRefresh,
    );
    addTearDown(session.dispose);

    var attempts = 0;
    Future<String> action() {
      attempts++;
      throw const GrpcError.unauthenticated('nope');
    }

    await expectLater(
      buildClient(session).call<String>(action),
      throwsA(isA<UnauthorizedException>()),
    );
    expect(attempts, 1);
  });
}
