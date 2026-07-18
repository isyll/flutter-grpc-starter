import 'dart:async';

import 'package:flutter_grpc_starter/core/logging/app_logger.dart';
import 'package:grpc/grpc.dart';

final class GrpcLoggingInterceptor extends ClientInterceptor {
  GrpcLoggingInterceptor({this._logger = const AppLogger('Grpc')});

  final AppLogger _logger;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final startedAt = DateTime.now();
    _logger.debug('→ ${method.path}');

    final response = invoker(method, request, options);
    response
        .then(
          (_) => _logger.debug('← ${method.path} OK${_elapsed(startedAt)}'),
          onError: (Object error) => _logger.warning(
            '← ${method.path} ${_describe(error)}${_elapsed(startedAt)}',
          ),
        )
        .ignore();
    return response;
  }

  String _elapsed(DateTime startedAt) =>
      ' (${DateTime.now().difference(startedAt).inMilliseconds}ms)';

  String _describe(Object error) =>
      error is GrpcError ? '${error.codeName} (${error.code})' : '$error';
}
