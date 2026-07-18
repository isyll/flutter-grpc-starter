// This is a generated file - do not edit.
//
// Generated from user/v1/user.proto.

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

@$core.Deprecated('Use updateMeRequestDescriptor instead')
const UpdateMeRequest$json = {
  '1': 'UpdateMeRequest',
  '2': [
    {
      '1': 'first_name',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'firstName',
      '17': true
    },
    {
      '1': 'last_name',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'lastName',
      '17': true
    },
    {
      '1': 'bio',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 2,
      '10': 'bio',
      '17': true
    },
    {
      '1': 'avatar',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 3,
      '10': 'avatar',
      '17': true
    },
  ],
  '8': [
    {'1': '_first_name'},
    {'1': '_last_name'},
    {'1': '_bio'},
    {'1': '_avatar'},
  ],
};

/// Descriptor for `UpdateMeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMeRequestDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVNZVJlcXVlc3QSKwoKZmlyc3RfbmFtZRgBIAEoCUIHukgEcgIYZEgAUglmaXJzdE'
    '5hbWWIAQESKQoJbGFzdF9uYW1lGAIgASgJQge6SARyAhhkSAFSCGxhc3ROYW1liAEBEh8KA2Jp'
    'bxgDIAEoCUIIukgFcgMY6AdIAlIDYmlviAEBEiUKBmF2YXRhchgEIAEoCUIIukgFcgMYgBBIA1'
    'IGYXZhdGFyiAEBQg0KC19maXJzdF9uYW1lQgwKCl9sYXN0X25hbWVCBgoEX2Jpb0IJCgdfYXZh'
    'dGFy');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIZCgJpZBgBIAEoCUIJukgGcgQQARhAUgJpZA==');

@$core.Deprecated('Use uploadAvatarRequestDescriptor instead')
const UploadAvatarRequest$json = {
  '1': 'UploadAvatarRequest',
  '2': [
    {
      '1': 'content_type',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'contentType'
    },
    {'1': 'chunk', '3': 2, '4': 1, '5': 12, '8': {}, '9': 0, '10': 'chunk'},
  ],
  '8': [
    {'1': 'data'},
  ],
};

/// Descriptor for `UploadAvatarRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadAvatarRequestDescriptor = $convert.base64Decode(
    'ChNVcGxvYWRBdmF0YXJSZXF1ZXN0EiwKDGNvbnRlbnRfdHlwZRgBIAEoCUIHukgEcgIYZEgAUg'
    'tjb250ZW50VHlwZRIhCgVjaHVuaxgCIAEoDEIJukgGegQYgIBASABSBWNodW5rQgYKBGRhdGE=');

@$core.Deprecated('Use uploadAvatarResponseDescriptor instead')
const UploadAvatarResponse$json = {
  '1': 'UploadAvatarResponse',
  '2': [
    {'1': 'avatar_url', '3': 1, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `UploadAvatarResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadAvatarResponseDescriptor = $convert.base64Decode(
    'ChRVcGxvYWRBdmF0YXJSZXNwb25zZRIdCgphdmF0YXJfdXJsGAEgASgJUglhdmF0YXJVcmw=');

@$core.Deprecated('Use registerPushTokenRequestDescriptor instead')
const RegisterPushTokenRequest$json = {
  '1': 'RegisterPushTokenRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'deviceId'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'token'},
    {'1': 'platform', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'platform'},
    {'1': 'app_version', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'appVersion'},
  ],
};

/// Descriptor for `RegisterPushTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerPushTokenRequestDescriptor = $convert.base64Decode(
    'ChhSZWdpc3RlclB1c2hUb2tlblJlcXVlc3QSJwoJZGV2aWNlX2lkGAEgASgJQgq6SAdyBRABGI'
    'ABUghkZXZpY2VJZBIgCgV0b2tlbhgCIAEoCUIKukgHcgUQARiABFIFdG9rZW4SIwoIcGxhdGZv'
    'cm0YAyABKAlCB7pIBHICGCBSCHBsYXRmb3JtEigKC2FwcF92ZXJzaW9uGAQgASgJQge6SARyAh'
    'ggUgphcHBWZXJzaW9u');

@$core.Deprecated('Use notificationPreferencesDescriptor instead')
const NotificationPreferences$json = {
  '1': 'NotificationPreferences',
  '2': [
    {'1': 'push', '3': 1, '4': 1, '5': 8, '10': 'push'},
    {'1': 'email', '3': 2, '4': 1, '5': 8, '10': 'email'},
    {'1': 'marketing', '3': 3, '4': 1, '5': 8, '10': 'marketing'},
    {
      '1': 'quiet_hours_enabled',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'quietHoursEnabled'
    },
    {'1': 'quiet_hours_start', '3': 5, '4': 1, '5': 9, '10': 'quietHoursStart'},
    {'1': 'quiet_hours_end', '3': 6, '4': 1, '5': 9, '10': 'quietHoursEnd'},
    {'1': 'timezone', '3': 7, '4': 1, '5': 9, '10': 'timezone'},
  ],
};

/// Descriptor for `NotificationPreferences`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationPreferencesDescriptor = $convert.base64Decode(
    'ChdOb3RpZmljYXRpb25QcmVmZXJlbmNlcxISCgRwdXNoGAEgASgIUgRwdXNoEhQKBWVtYWlsGA'
    'IgASgIUgVlbWFpbBIcCgltYXJrZXRpbmcYAyABKAhSCW1hcmtldGluZxIuChNxdWlldF9ob3Vy'
    'c19lbmFibGVkGAQgASgIUhFxdWlldEhvdXJzRW5hYmxlZBIqChFxdWlldF9ob3Vyc19zdGFydB'
    'gFIAEoCVIPcXVpZXRIb3Vyc1N0YXJ0EiYKD3F1aWV0X2hvdXJzX2VuZBgGIAEoCVINcXVpZXRI'
    'b3Vyc0VuZBIaCgh0aW1lem9uZRgHIAEoCVIIdGltZXpvbmU=');
