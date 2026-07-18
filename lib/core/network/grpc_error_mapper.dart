import 'package:flutter_grpc_starter/core/error/app_exception.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';

AppException mapGrpcError(GrpcError error) {
  final details = error.details ?? const <GeneratedMessage>[];
  final code = _errorInfoReason(details);
  final message = (error.message?.isNotEmpty ?? false)
      ? error.message!
      : _fallbackMessage(error.code);
  final fieldErrors = _fieldViolations(details);

  return switch (error.code) {
    StatusCode.unauthenticated => UnauthorizedException(message, code: code),
    StatusCode.invalidArgument || StatusCode.failedPrecondition
        when fieldErrors.isNotEmpty =>
      ValidationException(
        message,
        fieldErrors: fieldErrors,
        statusCode: error.code,
        code: code,
      ),
    StatusCode.deadlineExceeded => NetworkException(message, kind: .timeout),
    StatusCode.unavailable => NetworkException(message, kind: .offline),
    StatusCode.cancelled => NetworkException(message, kind: .cancelled),
    _ => ApiException(
      message,
      statusCode: error.code,
      code: code,
    ),
  };
}

String? _errorInfoReason(List<GeneratedMessage> details) {
  for (final detail in details) {
    if (detail.info_.qualifiedMessageName != 'google.rpc.ErrorInfo') continue;
    final reason = detail.getField(1);
    if (reason is String && reason.isNotEmpty) return reason;
  }
  return null;
}

Map<String, List<String>> _fieldViolations(List<GeneratedMessage> details) {
  final result = <String, List<String>>{};
  for (final detail in details) {
    if (detail.info_.qualifiedMessageName != 'google.rpc.BadRequest') continue;
    final violations = detail.getField(1);
    if (violations is! List) continue;
    for (final violation in violations) {
      if (violation is! GeneratedMessage) continue;
      final field = violation.getField(1);
      final description = violation.getField(2);
      if (field is String && field.isNotEmpty && description is String) {
        (result[field] ??= <String>[]).add(description);
      }
    }
  }
  return result;
}

String _fallbackMessage(int code) => switch (code) {
  StatusCode.unauthenticated => 'Authentication is required',
  StatusCode.permissionDenied => 'You do not have permission to do that',
  StatusCode.notFound => 'The requested resource was not found',
  StatusCode.alreadyExists => 'That resource already exists',
  StatusCode.invalidArgument => 'The request was invalid',
  StatusCode.resourceExhausted => 'Too many requests, please slow down',
  StatusCode.unavailable => 'Unable to reach the server',
  StatusCode.deadlineExceeded => 'The request timed out',
  _ => 'Something went wrong',
};
