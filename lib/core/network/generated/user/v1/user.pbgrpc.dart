// This is a generated file - do not edit.
//
// Generated from user/v1/user.proto.

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
import 'user.pb.dart' as $0;

export 'user.pb.dart';

/// UserService handles the authenticated user's own profile, settings,
/// push tokens, and notification preferences.
@$pb.GrpcServiceName('user.v1.UserService')
class UserServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserServiceClient(super.channel, {super.options, super.interceptors});

  /// GetUser is declared before the /v1/users/me routes on purpose: the
  /// grpc-gateway mux gives later registrations priority, so the literal
  /// "me" routes must come after the {id} wildcard to win the match.
  $grpc.ResponseFuture<$1.PublicUser> getUser(
    $0.GetUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.User> getMe(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getMe, request, options: options);
  }

  $grpc.ResponseFuture<$1.User> updateMe(
    $0.UpdateMeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateMe, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> deleteMe(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteMe, request, options: options);
  }

  /// UploadAvatar streams an avatar image to server-side object storage. The
  /// first message must carry content_type; subsequent messages carry file
  /// chunks. Size and content type are validated server-side. Client-streaming,
  /// so it is intentionally gRPC-only and not exposed through the gateway.
  $grpc.ResponseFuture<$0.UploadAvatarResponse> uploadAvatar(
    $async.Stream<$0.UploadAvatarRequest> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$uploadAvatar, request, options: options)
        .single;
  }

  $grpc.ResponseFuture<$1.Settings> getSettings(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSettings, request, options: options);
  }

  $grpc.ResponseFuture<$1.Settings> updateSettings(
    $1.Settings request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateSettings, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> registerPushToken(
    $0.RegisterPushTokenRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$registerPushToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.NotificationPreferences> getNotificationPreferences(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getNotificationPreferences, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.NotificationPreferences>
      updateNotificationPreferences(
    $0.NotificationPreferences request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateNotificationPreferences, request,
        options: options);
  }

  // method descriptors

  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $1.PublicUser>(
      '/user.v1.UserService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      $1.PublicUser.fromBuffer);
  static final _$getMe = $grpc.ClientMethod<$2.Empty, $1.User>(
      '/user.v1.UserService/GetMe',
      ($2.Empty value) => value.writeToBuffer(),
      $1.User.fromBuffer);
  static final _$updateMe = $grpc.ClientMethod<$0.UpdateMeRequest, $1.User>(
      '/user.v1.UserService/UpdateMe',
      ($0.UpdateMeRequest value) => value.writeToBuffer(),
      $1.User.fromBuffer);
  static final _$deleteMe = $grpc.ClientMethod<$2.Empty, $2.Empty>(
      '/user.v1.UserService/DeleteMe',
      ($2.Empty value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$uploadAvatar =
      $grpc.ClientMethod<$0.UploadAvatarRequest, $0.UploadAvatarResponse>(
          '/user.v1.UserService/UploadAvatar',
          ($0.UploadAvatarRequest value) => value.writeToBuffer(),
          $0.UploadAvatarResponse.fromBuffer);
  static final _$getSettings = $grpc.ClientMethod<$2.Empty, $1.Settings>(
      '/user.v1.UserService/GetSettings',
      ($2.Empty value) => value.writeToBuffer(),
      $1.Settings.fromBuffer);
  static final _$updateSettings = $grpc.ClientMethod<$1.Settings, $1.Settings>(
      '/user.v1.UserService/UpdateSettings',
      ($1.Settings value) => value.writeToBuffer(),
      $1.Settings.fromBuffer);
  static final _$registerPushToken =
      $grpc.ClientMethod<$0.RegisterPushTokenRequest, $2.Empty>(
          '/user.v1.UserService/RegisterPushToken',
          ($0.RegisterPushTokenRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$getNotificationPreferences =
      $grpc.ClientMethod<$2.Empty, $0.NotificationPreferences>(
          '/user.v1.UserService/GetNotificationPreferences',
          ($2.Empty value) => value.writeToBuffer(),
          $0.NotificationPreferences.fromBuffer);
  static final _$updateNotificationPreferences = $grpc.ClientMethod<
          $0.NotificationPreferences, $0.NotificationPreferences>(
      '/user.v1.UserService/UpdateNotificationPreferences',
      ($0.NotificationPreferences value) => value.writeToBuffer(),
      $0.NotificationPreferences.fromBuffer);
}

@$pb.GrpcServiceName('user.v1.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.v1.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $1.PublicUser>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($1.PublicUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.User>(
        'GetMe',
        getMe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateMeRequest, $1.User>(
        'UpdateMe',
        updateMe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateMeRequest.fromBuffer(value),
        ($1.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $2.Empty>(
        'DeleteMe',
        deleteMe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UploadAvatarRequest, $0.UploadAvatarResponse>(
            'UploadAvatar',
            uploadAvatar,
            true,
            false,
            ($core.List<$core.int> value) =>
                $0.UploadAvatarRequest.fromBuffer(value),
            ($0.UploadAvatarResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.Settings>(
        'GetSettings',
        getSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.Settings value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Settings, $1.Settings>(
        'UpdateSettings',
        updateSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Settings.fromBuffer(value),
        ($1.Settings value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterPushTokenRequest, $2.Empty>(
        'RegisterPushToken',
        registerPushToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RegisterPushTokenRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.NotificationPreferences>(
        'GetNotificationPreferences',
        getNotificationPreferences_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.NotificationPreferences value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NotificationPreferences,
            $0.NotificationPreferences>(
        'UpdateNotificationPreferences',
        updateNotificationPreferences_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.NotificationPreferences.fromBuffer(value),
        ($0.NotificationPreferences value) => value.writeToBuffer()));
  }

  $async.Future<$1.PublicUser> getUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetUserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$1.PublicUser> getUser(
      $grpc.ServiceCall call, $0.GetUserRequest request);

  $async.Future<$1.User> getMe_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getMe($call, await $request);
  }

  $async.Future<$1.User> getMe($grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.User> updateMe_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateMeRequest> $request) async {
    return updateMe($call, await $request);
  }

  $async.Future<$1.User> updateMe(
      $grpc.ServiceCall call, $0.UpdateMeRequest request);

  $async.Future<$2.Empty> deleteMe_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return deleteMe($call, await $request);
  }

  $async.Future<$2.Empty> deleteMe($grpc.ServiceCall call, $2.Empty request);

  $async.Future<$0.UploadAvatarResponse> uploadAvatar(
      $grpc.ServiceCall call, $async.Stream<$0.UploadAvatarRequest> request);

  $async.Future<$1.Settings> getSettings_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getSettings($call, await $request);
  }

  $async.Future<$1.Settings> getSettings(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Settings> updateSettings_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Settings> $request) async {
    return updateSettings($call, await $request);
  }

  $async.Future<$1.Settings> updateSettings(
      $grpc.ServiceCall call, $1.Settings request);

  $async.Future<$2.Empty> registerPushToken_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RegisterPushTokenRequest> $request) async {
    return registerPushToken($call, await $request);
  }

  $async.Future<$2.Empty> registerPushToken(
      $grpc.ServiceCall call, $0.RegisterPushTokenRequest request);

  $async.Future<$0.NotificationPreferences> getNotificationPreferences_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getNotificationPreferences($call, await $request);
  }

  $async.Future<$0.NotificationPreferences> getNotificationPreferences(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$0.NotificationPreferences> updateNotificationPreferences_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.NotificationPreferences> $request) async {
    return updateNotificationPreferences($call, await $request);
  }

  $async.Future<$0.NotificationPreferences> updateNotificationPreferences(
      $grpc.ServiceCall call, $0.NotificationPreferences request);
}
