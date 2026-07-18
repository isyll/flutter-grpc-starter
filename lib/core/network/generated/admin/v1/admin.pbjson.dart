// This is a generated file - do not edit.
//
// Generated from admin/v1/admin.proto.

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

@$core.Deprecated('Use listUsersRequestDescriptor instead')
const ListUsersRequest$json = {
  '1': 'ListUsersRequest',
  '2': [
    {
      '1': 'page',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.common.v1.Page',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VXNlcnNSZXF1ZXN0EiMKBHBhZ2UYASABKAsyDy5jb21tb24udjEuUGFnZVIEcGFnZQ'
    '==');

@$core.Deprecated('Use listUsersResponseDescriptor instead')
const ListUsersResponse$json = {
  '1': 'ListUsersResponse',
  '2': [
    {
      '1': 'users',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.common.v1.User',
      '10': 'users'
    },
    {'1': 'total', '3': 2, '4': 1, '5': 3, '10': 'total'},
  ],
};

/// Descriptor for `ListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VXNlcnNSZXNwb25zZRIlCgV1c2VycxgBIAMoCzIPLmNvbW1vbi52MS5Vc2VyUgV1c2'
    'VycxIUCgV0b3RhbBgCIAEoA1IFdG90YWw=');

@$core.Deprecated('Use adminGetUserRequestDescriptor instead')
const AdminGetUserRequest$json = {
  '1': 'AdminGetUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
  ],
};

/// Descriptor for `AdminGetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminGetUserRequestDescriptor =
    $convert.base64Decode(
        'ChNBZG1pbkdldFVzZXJSZXF1ZXN0EhkKAmlkGAEgASgJQgm6SAZyBBABGEBSAmlk');

@$core.Deprecated('Use suspendUserRequestDescriptor instead')
const SuspendUserRequest$json = {
  '1': 'SuspendUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'reason'},
    {'1': 'details', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'details'},
    {'1': 'permanent', '3': 4, '4': 1, '5': 8, '10': 'permanent'},
    {'1': 'days', '3': 5, '4': 1, '5': 5, '8': {}, '10': 'days'},
  ],
};

/// Descriptor for `SuspendUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suspendUserRequestDescriptor = $convert.base64Decode(
    'ChJTdXNwZW5kVXNlclJlcXVlc3QSGQoCaWQYASABKAlCCbpIBnIEEAEYQFICaWQSIgoGcmVhc2'
    '9uGAIgASgJQgq6SAdyBRABGMgBUgZyZWFzb24SIgoHZGV0YWlscxgDIAEoCUIIukgFcgMY0A9S'
    'B2RldGFpbHMSHAoJcGVybWFuZW50GAQgASgIUglwZXJtYW5lbnQSHgoEZGF5cxgFIAEoBUIKuk'
    'gHGgUYwhwoAFIEZGF5cw==');

@$core.Deprecated('Use unsuspendUserRequestDescriptor instead')
const UnsuspendUserRequest$json = {
  '1': 'UnsuspendUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
  ],
};

/// Descriptor for `UnsuspendUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsuspendUserRequestDescriptor =
    $convert.base64Decode(
        'ChRVbnN1c3BlbmRVc2VyUmVxdWVzdBIZCgJpZBgBIAEoCUIJukgGcgQQARhAUgJpZA==');

@$core.Deprecated('Use setUserRoleRequestDescriptor instead')
const SetUserRoleRequest$json = {
  '1': 'SetUserRoleRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
    {'1': 'role', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'role'},
  ],
};

/// Descriptor for `SetUserRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setUserRoleRequestDescriptor = $convert.base64Decode(
    'ChJTZXRVc2VyUm9sZVJlcXVlc3QSGQoCaWQYASABKAlCCbpIBnIEEAEYQFICaWQSJgoEcm9sZR'
    'gCIAEoCUISukgPcg1SBHVzZXJSBWFkbWluUgRyb2xl');
