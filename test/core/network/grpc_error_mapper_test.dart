import 'package:flutter_grpc_starter/core/error/app_exception.dart';
import 'package:flutter_grpc_starter/core/network/grpc_error_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/src/generated/google/rpc/error_details.pb.dart';

void main() {
  test('maps unauthenticated to UnauthorizedException with the app code', () {
    final mapped = mapGrpcError(
      GrpcError.unauthenticated('Invalid credentials', [
        ErrorInfo(reason: 'INVALID_CREDENTIALS', domain: 'go-grpc-starter'),
      ]),
    );

    expect(mapped, isA<UnauthorizedException>());
    expect((mapped as ApiException).code, 'INVALID_CREDENTIALS');
    expect(mapped.message, 'Invalid credentials');
  });

  test('maps invalidArgument with field violations to ValidationException', () {
    final mapped = mapGrpcError(
      GrpcError.invalidArgument('Validation failed', [
        BadRequest(
          fieldViolations: [
            BadRequest_FieldViolation(
              field_1: 'email',
              description: 'must be a valid email',
            ),
          ],
        ),
      ]),
    );

    expect(mapped, isA<ValidationException>());
    expect(
      (mapped as ValidationException).fieldErrors['email'],
      ['must be a valid email'],
    );
  });

  test('maps unavailable to an offline NetworkException', () {
    final mapped = mapGrpcError(const GrpcError.unavailable('server down'));

    expect(mapped, isA<NetworkException>());
    expect((mapped as NetworkException).kind, NetworkFailureKind.offline);
  });

  test('maps deadlineExceeded to a timeout NetworkException', () {
    final mapped = mapGrpcError(const GrpcError.deadlineExceeded('too slow'));

    expect((mapped as NetworkException).kind, NetworkFailureKind.timeout);
  });

  test('maps unknown codes to ApiException carrying the gRPC status code', () {
    final mapped = mapGrpcError(const GrpcError.notFound('missing'));

    expect(mapped, isA<ApiException>());
    expect((mapped as ApiException).statusCode, StatusCode.notFound);
  });

  test('falls back to a default message when none is provided', () {
    final mapped = mapGrpcError(const GrpcError.internal());

    expect(mapped, isA<ApiException>());
    expect(mapped.message, isNotEmpty);
  });
}
