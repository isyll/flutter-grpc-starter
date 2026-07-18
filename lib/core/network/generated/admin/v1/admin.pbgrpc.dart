// This is a generated file - do not edit.
//
// Generated from admin/v1/admin.proto.

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
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $2;

import '../../common/v1/common.pb.dart' as $1;
import 'admin.pb.dart' as $0;

export 'admin.pb.dart';

/// AdminService is guarded by the admin role. It manages users and
/// moderation.
@$pb.GrpcServiceName('admin.v1.AdminService')
class AdminServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AdminServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ListUsersResponse> listUsers(
    $0.ListUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.User> getUser(
    $0.AdminGetUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> suspendUser(
    $0.SuspendUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$suspendUser, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> unsuspendUser(
    $0.UnsuspendUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unsuspendUser, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> setUserRole(
    $0.SetUserRoleRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setUserRole, request, options: options);
  }

  // method descriptors

  static final _$listUsers =
      $grpc.ClientMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
          '/admin.v1.AdminService/ListUsers',
          ($0.ListUsersRequest value) => value.writeToBuffer(),
          $0.ListUsersResponse.fromBuffer);
  static final _$getUser = $grpc.ClientMethod<$0.AdminGetUserRequest, $1.User>(
      '/admin.v1.AdminService/GetUser',
      ($0.AdminGetUserRequest value) => value.writeToBuffer(),
      $1.User.fromBuffer);
  static final _$suspendUser =
      $grpc.ClientMethod<$0.SuspendUserRequest, $2.Empty>(
          '/admin.v1.AdminService/SuspendUser',
          ($0.SuspendUserRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$unsuspendUser =
      $grpc.ClientMethod<$0.UnsuspendUserRequest, $2.Empty>(
          '/admin.v1.AdminService/UnsuspendUser',
          ($0.UnsuspendUserRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$setUserRole =
      $grpc.ClientMethod<$0.SetUserRoleRequest, $2.Empty>(
          '/admin.v1.AdminService/SetUserRole',
          ($0.SetUserRoleRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
}

@$pb.GrpcServiceName('admin.v1.AdminService')
abstract class AdminServiceBase extends $grpc.Service {
  $core.String get $name => 'admin.v1.AdminService';

  AdminServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListUsersRequest.fromBuffer(value),
        ($0.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AdminGetUserRequest, $1.User>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AdminGetUserRequest.fromBuffer(value),
        ($1.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SuspendUserRequest, $2.Empty>(
        'SuspendUser',
        suspendUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SuspendUserRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UnsuspendUserRequest, $2.Empty>(
        'UnsuspendUser',
        unsuspendUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UnsuspendUserRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetUserRoleRequest, $2.Empty>(
        'SetUserRole',
        setUserRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetUserRoleRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListUsersResponse> listUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListUsersRequest> $request) async {
    return listUsers($call, await $request);
  }

  $async.Future<$0.ListUsersResponse> listUsers(
      $grpc.ServiceCall call, $0.ListUsersRequest request);

  $async.Future<$1.User> getUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AdminGetUserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$1.User> getUser(
      $grpc.ServiceCall call, $0.AdminGetUserRequest request);

  $async.Future<$2.Empty> suspendUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SuspendUserRequest> $request) async {
    return suspendUser($call, await $request);
  }

  $async.Future<$2.Empty> suspendUser(
      $grpc.ServiceCall call, $0.SuspendUserRequest request);

  $async.Future<$2.Empty> unsuspendUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UnsuspendUserRequest> $request) async {
    return unsuspendUser($call, await $request);
  }

  $async.Future<$2.Empty> unsuspendUser(
      $grpc.ServiceCall call, $0.UnsuspendUserRequest request);

  $async.Future<$2.Empty> setUserRole_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SetUserRoleRequest> $request) async {
    return setUserRole($call, await $request);
  }

  $async.Future<$2.Empty> setUserRole(
      $grpc.ServiceCall call, $0.SetUserRoleRequest request);
}
