// This is a generated file - do not edit.
//
// Generated from auth/v1/auth.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'password'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'lastName'},
    {
      '1': 'device',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.common.v1.DeviceInfo',
      '10': 'device'
    },
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSIAoFZW1haWwYASABKAlCCrpIB3IFGP4BYAFSBWVtYWlsEiYKCH'
    'Bhc3N3b3JkGAIgASgJQgq6SAdyBRAIGIABUghwYXNzd29yZBIoCgpmaXJzdF9uYW1lGAMgASgJ'
    'Qgm6SAZyBBABGGRSCWZpcnN0TmFtZRImCglsYXN0X25hbWUYBCABKAlCCbpIBnIEEAEYZFIIbG'
    'FzdE5hbWUSLQoGZGV2aWNlGAUgASgLMhUuY29tbW9uLnYxLkRldmljZUluZm9SBmRldmljZQ==');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'password'},
    {
      '1': 'device',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.common.v1.DeviceInfo',
      '10': 'device'
    },
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSIAoFZW1haWwYASABKAlCCrpIB3IFGP4BYAFSBWVtYWlsEiYKCHBhc3'
    'N3b3JkGAIgASgJQgq6SAdyBRABGIABUghwYXNzd29yZBItCgZkZXZpY2UYAyABKAsyFS5jb21t'
    'b24udjEuRGV2aWNlSW5mb1IGZGV2aWNl');

@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = {
  '1': 'RefreshTokenRequest',
  '2': [
    {
      '1': 'refresh_token',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'refreshToken'
    },
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoVG9rZW5SZXF1ZXN0Ei8KDXJlZnJlc2hfdG9rZW4YASABKAlCCrpIB3IFEAEYgA'
    'RSDHJlZnJlc2hUb2tlbg==');

@$core.Deprecated('Use verifyEmailRequestDescriptor instead')
const VerifyEmailRequest$json = {
  '1': 'VerifyEmailRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'token'},
  ],
};

/// Descriptor for `VerifyEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailRequestDescriptor = $convert.base64Decode(
    'ChJWZXJpZnlFbWFpbFJlcXVlc3QSIAoFdG9rZW4YASABKAlCCrpIB3IFEAEYgAFSBXRva2Vu');

@$core.Deprecated('Use requestPasswordResetRequestDescriptor instead')
const RequestPasswordResetRequest$json = {
  '1': 'RequestPasswordResetRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'email'},
  ],
};

/// Descriptor for `RequestPasswordResetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestPasswordResetRequestDescriptor =
    $convert.base64Decode(
        'ChtSZXF1ZXN0UGFzc3dvcmRSZXNldFJlcXVlc3QSIAoFZW1haWwYASABKAlCCrpIB3IFGP4BYA'
        'FSBWVtYWls');

@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = {
  '1': 'ResetPasswordRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'token'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'newPassword'},
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode(
    'ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIgCgV0b2tlbhgBIAEoCUIKukgHcgUQARiAAVIFdG9rZW'
    '4SLQoMbmV3X3Bhc3N3b3JkGAIgASgJQgq6SAdyBRAIGIABUgtuZXdQYXNzd29yZA==');

@$core.Deprecated('Use changePasswordRequestDescriptor instead')
const ChangePasswordRequest$json = {
  '1': 'ChangePasswordRequest',
  '2': [
    {
      '1': 'current_password',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'currentPassword'
    },
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordRequestDescriptor = $convert.base64Decode(
    'ChVDaGFuZ2VQYXNzd29yZFJlcXVlc3QSNQoQY3VycmVudF9wYXNzd29yZBgBIAEoCUIKukgHcg'
    'UQARiAAVIPY3VycmVudFBhc3N3b3JkEi0KDG5ld19wYXNzd29yZBgCIAEoCUIKukgHcgUQCBiA'
    'AVILbmV3UGFzc3dvcmQ=');

@$core.Deprecated('Use listDevicesResponseDescriptor instead')
const ListDevicesResponse$json = {
  '1': 'ListDevicesResponse',
  '2': [
    {
      '1': 'devices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.common.v1.Device',
      '10': 'devices'
    },
  ],
};

/// Descriptor for `ListDevicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDevicesResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0RGV2aWNlc1Jlc3BvbnNlEisKB2RldmljZXMYASADKAsyES5jb21tb24udjEuRGV2aW'
    'NlUgdkZXZpY2Vz');

@$core.Deprecated('Use revokeDeviceRequestDescriptor instead')
const RevokeDeviceRequest$json = {
  '1': 'RevokeDeviceRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'deviceId'},
  ],
};

/// Descriptor for `RevokeDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revokeDeviceRequestDescriptor = $convert.base64Decode(
    'ChNSZXZva2VEZXZpY2VSZXF1ZXN0EicKCWRldmljZV9pZBgBIAEoCUIKukgHcgUQARiAAVIIZG'
    'V2aWNlSWQ=');
