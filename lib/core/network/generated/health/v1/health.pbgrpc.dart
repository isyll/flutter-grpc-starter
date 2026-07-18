// This is a generated file - do not edit.
//
// Generated from health/v1/health.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

import 'health.pb.dart' as $1;

export 'health.pb.dart';

/// HealthService reports liveness and readiness.
@$pb.GrpcServiceName('health.v1.HealthService')
class HealthServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  HealthServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.HealthResponse> check(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$check, request, options: options);
  }

  $grpc.ResponseFuture<$1.HealthResponse> ready(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ready, request, options: options);
  }

  // method descriptors

  static final _$check = $grpc.ClientMethod<$0.Empty, $1.HealthResponse>(
      '/health.v1.HealthService/Check',
      ($0.Empty value) => value.writeToBuffer(),
      $1.HealthResponse.fromBuffer);
  static final _$ready = $grpc.ClientMethod<$0.Empty, $1.HealthResponse>(
      '/health.v1.HealthService/Ready',
      ($0.Empty value) => value.writeToBuffer(),
      $1.HealthResponse.fromBuffer);
}

@$pb.GrpcServiceName('health.v1.HealthService')
abstract class HealthServiceBase extends $grpc.Service {
  $core.String get $name => 'health.v1.HealthService';

  HealthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.HealthResponse>(
        'Check',
        check_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.HealthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.HealthResponse>(
        'Ready',
        ready_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.HealthResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.HealthResponse> check_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return check($call, await $request);
  }

  $async.Future<$1.HealthResponse> check(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.HealthResponse> ready_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return ready($call, await $request);
  }

  $async.Future<$1.HealthResponse> ready(
      $grpc.ServiceCall call, $0.Empty request);
}
