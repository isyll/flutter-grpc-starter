// This is a generated file - do not edit.
//
// Generated from common/v1/common.proto.

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

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'avatar', '3': 5, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'bio', '3': 6, '4': 1, '5': 9, '10': 'bio'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {'1': 'role', '3': 8, '4': 1, '5': 9, '10': 'role'},
    {'1': 'email_verified', '3': 9, '4': 1, '5': 8, '10': 'emailVerified'},
    {
      '1': 'created_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSHQoKZmlyc3Rfbm'
    'FtZRgDIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgEIAEoCVIIbGFzdE5hbWUSFgoGYXZh'
    'dGFyGAUgASgJUgZhdmF0YXISEAoDYmlvGAYgASgJUgNiaW8SFgoGc3RhdHVzGAcgASgJUgZzdG'
    'F0dXMSEgoEcm9sZRgIIAEoCVIEcm9sZRIlCg5lbWFpbF92ZXJpZmllZBgJIAEoCFINZW1haWxW'
    'ZXJpZmllZBI5CgpjcmVhdGVkX2F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcF'
    'IJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use publicUserDescriptor instead')
const PublicUser$json = {
  '1': 'PublicUser',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'bio', '3': 5, '4': 1, '5': 9, '10': 'bio'},
    {
      '1': 'member_since',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'memberSince'
    },
  ],
};

/// Descriptor for `PublicUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicUserDescriptor = $convert.base64Decode(
    'CgpQdWJsaWNVc2VyEg4KAmlkGAEgASgJUgJpZBIdCgpmaXJzdF9uYW1lGAIgASgJUglmaXJzdE'
    '5hbWUSGwoJbGFzdF9uYW1lGAMgASgJUghsYXN0TmFtZRIWCgZhdmF0YXIYBCABKAlSBmF2YXRh'
    'chIQCgNiaW8YBSABKAlSA2JpbxI9CgxtZW1iZXJfc2luY2UYBiABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wUgttZW1iZXJTaW5jZQ==');

@$core.Deprecated('Use settingsDescriptor instead')
const Settings$json = {
  '1': 'Settings',
  '2': [
    {'1': 'locale', '3': 1, '4': 1, '5': 9, '10': 'locale'},
    {'1': 'timezone', '3': 2, '4': 1, '5': 9, '10': 'timezone'},
    {'1': 'theme', '3': 3, '4': 1, '5': 9, '10': 'theme'},
    {
      '1': 'email_notifications',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'emailNotifications'
    },
    {
      '1': 'push_notifications',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'pushNotifications'
    },
    {'1': 'marketing_emails', '3': 6, '4': 1, '5': 8, '10': 'marketingEmails'},
  ],
};

/// Descriptor for `Settings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingsDescriptor = $convert.base64Decode(
    'CghTZXR0aW5ncxIWCgZsb2NhbGUYASABKAlSBmxvY2FsZRIaCgh0aW1lem9uZRgCIAEoCVIIdG'
    'ltZXpvbmUSFAoFdGhlbWUYAyABKAlSBXRoZW1lEi8KE2VtYWlsX25vdGlmaWNhdGlvbnMYBCAB'
    'KAhSEmVtYWlsTm90aWZpY2F0aW9ucxItChJwdXNoX25vdGlmaWNhdGlvbnMYBSABKAhSEXB1c2'
    'hOb3RpZmljYXRpb25zEikKEG1hcmtldGluZ19lbWFpbHMYBiABKAhSD21hcmtldGluZ0VtYWls'
    'cw==');

@$core.Deprecated('Use tokenPairDescriptor instead')
const TokenPair$json = {
  '1': 'TokenPair',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'expires_in', '3': 3, '4': 1, '5': 3, '10': 'expiresIn'},
    {
      '1': 'user',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.common.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `TokenPair`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenPairDescriptor = $convert.base64Decode(
    'CglUb2tlblBhaXISIQoMYWNjZXNzX3Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIjCg1yZWZyZX'
    'NoX3Rva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4SHQoKZXhwaXJlc19pbhgDIAEoA1IJZXhwaXJl'
    'c0luEiMKBHVzZXIYBCABKAsyDy5jb21tb24udjEuVXNlclIEdXNlcg==');

@$core.Deprecated('Use deviceInfoDescriptor instead')
const DeviceInfo$json = {
  '1': 'DeviceInfo',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'platform', '3': 3, '4': 1, '5': 9, '10': 'platform'},
    {'1': 'model', '3': 4, '4': 1, '5': 9, '10': 'model'},
    {'1': 'manufacturer', '3': 5, '4': 1, '5': 9, '10': 'manufacturer'},
  ],
};

/// Descriptor for `DeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceInfoDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VJbmZvEhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSEgoEbmFtZRgCIAEoCV'
    'IEbmFtZRIaCghwbGF0Zm9ybRgDIAEoCVIIcGxhdGZvcm0SFAoFbW9kZWwYBCABKAlSBW1vZGVs'
    'EiIKDG1hbnVmYWN0dXJlchgFIAEoCVIMbWFudWZhY3R1cmVy');

@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = {
  '1': 'Device',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'platform', '3': 3, '4': 1, '5': 9, '10': 'platform'},
    {'1': 'manufacturer', '3': 4, '4': 1, '5': 9, '10': 'manufacturer'},
    {'1': 'model', '3': 5, '4': 1, '5': 9, '10': 'model'},
    {
      '1': 'last_used_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastUsedAt'
    },
    {'1': 'current', '3': 7, '4': 1, '5': 8, '10': 'current'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode(
    'CgZEZXZpY2USGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2VJZBISCgRuYW1lGAIgASgJUgRuYW'
    '1lEhoKCHBsYXRmb3JtGAMgASgJUghwbGF0Zm9ybRIiCgxtYW51ZmFjdHVyZXIYBCABKAlSDG1h'
    'bnVmYWN0dXJlchIUCgVtb2RlbBgFIAEoCVIFbW9kZWwSPAoMbGFzdF91c2VkX2F0GAYgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbGFzdFVzZWRBdBIYCgdjdXJyZW50GAcgASgI'
    'UgdjdXJyZW50');

@$core.Deprecated('Use pageDescriptor instead')
const Page$json = {
  '1': 'Page',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `Page`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageDescriptor = $convert.base64Decode(
    'CgRQYWdlEhIKBHBhZ2UYASABKAVSBHBhZ2USGwoJcGFnZV9zaXplGAIgASgFUghwYWdlU2l6ZQ'
    '==');
