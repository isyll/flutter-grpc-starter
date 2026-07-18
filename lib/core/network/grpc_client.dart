import 'package:flutter/foundation.dart';
import 'package:flutter_grpc_starter/core/config/grpc_config.dart';
import 'package:flutter_grpc_starter/core/error/app_exception.dart';
import 'package:flutter_grpc_starter/core/error/result.dart';
import 'package:flutter_grpc_starter/core/network/generated/admin/v1/admin.pbgrpc.dart';
import 'package:flutter_grpc_starter/core/network/generated/auth/v1/auth.pbgrpc.dart';
import 'package:flutter_grpc_starter/core/network/generated/health/v1/health.pbgrpc.dart';
import 'package:flutter_grpc_starter/core/network/generated/user/v1/user.pbgrpc.dart';
import 'package:flutter_grpc_starter/core/network/grpc_error_mapper.dart';
import 'package:flutter_grpc_starter/core/network/grpc_logging_interceptor.dart';
import 'package:flutter_grpc_starter/core/network/grpc_metadata.dart';
import 'package:flutter_grpc_starter/core/network/network_timeouts.dart';
import 'package:flutter_grpc_starter/core/session/session_manager.dart';
import 'package:flutter_grpc_starter/services/device/device_info.dart';
import 'package:grpc/grpc.dart';

final class GrpcChannelFactory {
  const GrpcChannelFactory(this._config);

  final GrpcConfig _config;

  ClientChannel create({String? userAgent}) => ClientChannel(
    _config.host,
    port: _config.port,
    options: ChannelOptions(
      credentials: _config.useTls
          ? const ChannelCredentials.secure()
          : const ChannelCredentials.insecure(),
      connectTimeout: NetworkTimeouts.connect,
      userAgent: userAgent ?? 'flutter_grpc_starter',
    ),
  );
}

final class GrpcClient {
  GrpcClient({
    required this._channel,
    required SessionManager session,
    required DeviceInfo deviceInfo,
    LocaleResolver? localeResolver,
  }) : _session = session,
       _options = CallOptions(
         providers: [
           authMetadataProvider(session),
           localeMetadataProvider(localeResolver),
           clientInfoMetadataProvider(deviceInfo),
         ],
       ),
       _interceptors = [if (kDebugMode) GrpcLoggingInterceptor()];

  final ClientChannel _channel;
  final SessionManager _session;
  final CallOptions _options;
  final List<ClientInterceptor> _interceptors;

  late final AuthServiceClient auth = .new(
    _channel,
    options: _options,
    interceptors: _interceptors,
  );

  late final UserServiceClient user = .new(
    _channel,
    options: _options,
    interceptors: _interceptors,
  );

  late final HealthServiceClient health = .new(
    _channel,
    options: _options,
    interceptors: _interceptors,
  );

  late final AdminServiceClient admin = .new(
    _channel,
    options: _options,
    interceptors: _interceptors,
  );

  Future<T> call<T>(Future<T> Function() request) async {
    try {
      return await _withAuthRetry(request);
    } on GrpcError catch (error) {
      throw mapGrpcError(error);
    }
  }

  Future<Result<T>> run<T>(Future<T> Function() request) async {
    try {
      return .success(await call(request));
    } on AppException catch (error) {
      return .failure(error);
    } on Object catch (error, stackTrace) {
      return .failure(
        UnexpectedException(
          'An unexpected error occurred',
          cause: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  Future<T> _withAuthRetry<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on GrpcError catch (error) {
      if (error.code != StatusCode.unauthenticated ||
          _session.status != SessionStatus.active) {
        rethrow;
      }
      final token = await _session.refreshAccessToken();
      if (token == null) rethrow;
      return request();
    }
  }

  Future<void> close() => _channel.shutdown();
}
