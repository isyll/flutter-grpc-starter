// This is a generated file - do not edit.
//
// Generated from auth/v1/auth.proto.

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
import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

/// AuthService handles registration, login, tokens, and devices.
@$pb.GrpcServiceName('auth.v1.AuthService')
class AuthServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.TokenPair> register(
    $0.RegisterRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$1.TokenPair> login(
    $0.LoginRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.TokenPair> refreshToken(
    $0.RefreshTokenRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> logout(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> verifyEmail(
    $0.VerifyEmailRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verifyEmail, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> resendVerification(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resendVerification, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> requestPasswordReset(
    $0.RequestPasswordResetRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestPasswordReset, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> resetPassword(
    $0.ResetPasswordRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> changePassword(
    $0.ChangePasswordRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListDevicesResponse> listDevices(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDevices, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> revokeDevice(
    $0.RevokeDeviceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$revokeDevice, request, options: options);
  }

  // method descriptors

  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $1.TokenPair>(
          '/auth.v1.AuthService/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          $1.TokenPair.fromBuffer);
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $1.TokenPair>(
      '/auth.v1.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      $1.TokenPair.fromBuffer);
  static final _$refreshToken =
      $grpc.ClientMethod<$0.RefreshTokenRequest, $1.TokenPair>(
          '/auth.v1.AuthService/RefreshToken',
          ($0.RefreshTokenRequest value) => value.writeToBuffer(),
          $1.TokenPair.fromBuffer);
  static final _$logout = $grpc.ClientMethod<$2.Empty, $2.Empty>(
      '/auth.v1.AuthService/Logout',
      ($2.Empty value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$verifyEmail =
      $grpc.ClientMethod<$0.VerifyEmailRequest, $2.Empty>(
          '/auth.v1.AuthService/VerifyEmail',
          ($0.VerifyEmailRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$resendVerification = $grpc.ClientMethod<$2.Empty, $2.Empty>(
      '/auth.v1.AuthService/ResendVerification',
      ($2.Empty value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$requestPasswordReset =
      $grpc.ClientMethod<$0.RequestPasswordResetRequest, $2.Empty>(
          '/auth.v1.AuthService/RequestPasswordReset',
          ($0.RequestPasswordResetRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$resetPassword =
      $grpc.ClientMethod<$0.ResetPasswordRequest, $2.Empty>(
          '/auth.v1.AuthService/ResetPassword',
          ($0.ResetPasswordRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$changePassword =
      $grpc.ClientMethod<$0.ChangePasswordRequest, $2.Empty>(
          '/auth.v1.AuthService/ChangePassword',
          ($0.ChangePasswordRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$listDevices =
      $grpc.ClientMethod<$2.Empty, $0.ListDevicesResponse>(
          '/auth.v1.AuthService/ListDevices',
          ($2.Empty value) => value.writeToBuffer(),
          $0.ListDevicesResponse.fromBuffer);
  static final _$revokeDevice =
      $grpc.ClientMethod<$0.RevokeDeviceRequest, $2.Empty>(
          '/auth.v1.AuthService/RevokeDevice',
          ($0.RevokeDeviceRequest value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
}

@$pb.GrpcServiceName('auth.v1.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.v1.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $1.TokenPair>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($1.TokenPair value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $1.TokenPair>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($1.TokenPair value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshTokenRequest, $1.TokenPair>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RefreshTokenRequest.fromBuffer(value),
        ($1.TokenPair value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $2.Empty>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyEmailRequest, $2.Empty>(
        'VerifyEmail',
        verifyEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyEmailRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $2.Empty>(
        'ResendVerification',
        resendVerification_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestPasswordResetRequest, $2.Empty>(
        'RequestPasswordReset',
        requestPasswordReset_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestPasswordResetRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResetPasswordRequest, $2.Empty>(
        'ResetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResetPasswordRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangePasswordRequest, $2.Empty>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ChangePasswordRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.ListDevicesResponse>(
        'ListDevices',
        listDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.ListDevicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RevokeDeviceRequest, $2.Empty>(
        'RevokeDevice',
        revokeDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RevokeDeviceRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.TokenPair> register_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RegisterRequest> $request) async {
    return register($call, await $request);
  }

  $async.Future<$1.TokenPair> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);

  $async.Future<$1.TokenPair> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$1.TokenPair> login(
      $grpc.ServiceCall call, $0.LoginRequest request);

  $async.Future<$1.TokenPair> refreshToken_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RefreshTokenRequest> $request) async {
    return refreshToken($call, await $request);
  }

  $async.Future<$1.TokenPair> refreshToken(
      $grpc.ServiceCall call, $0.RefreshTokenRequest request);

  $async.Future<$2.Empty> logout_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return logout($call, await $request);
  }

  $async.Future<$2.Empty> logout($grpc.ServiceCall call, $2.Empty request);

  $async.Future<$2.Empty> verifyEmail_Pre($grpc.ServiceCall $call,
      $async.Future<$0.VerifyEmailRequest> $request) async {
    return verifyEmail($call, await $request);
  }

  $async.Future<$2.Empty> verifyEmail(
      $grpc.ServiceCall call, $0.VerifyEmailRequest request);

  $async.Future<$2.Empty> resendVerification_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return resendVerification($call, await $request);
  }

  $async.Future<$2.Empty> resendVerification(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$2.Empty> requestPasswordReset_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RequestPasswordResetRequest> $request) async {
    return requestPasswordReset($call, await $request);
  }

  $async.Future<$2.Empty> requestPasswordReset(
      $grpc.ServiceCall call, $0.RequestPasswordResetRequest request);

  $async.Future<$2.Empty> resetPassword_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ResetPasswordRequest> $request) async {
    return resetPassword($call, await $request);
  }

  $async.Future<$2.Empty> resetPassword(
      $grpc.ServiceCall call, $0.ResetPasswordRequest request);

  $async.Future<$2.Empty> changePassword_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ChangePasswordRequest> $request) async {
    return changePassword($call, await $request);
  }

  $async.Future<$2.Empty> changePassword(
      $grpc.ServiceCall call, $0.ChangePasswordRequest request);

  $async.Future<$0.ListDevicesResponse> listDevices_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return listDevices($call, await $request);
  }

  $async.Future<$0.ListDevicesResponse> listDevices(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$2.Empty> revokeDevice_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RevokeDeviceRequest> $request) async {
    return revokeDevice($call, await $request);
  }

  $async.Future<$2.Empty> revokeDevice(
      $grpc.ServiceCall call, $0.RevokeDeviceRequest request);
}
