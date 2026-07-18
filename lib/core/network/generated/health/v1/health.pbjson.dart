// This is a generated file - do not edit.
//
// Generated from health/v1/health.proto.

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

@$core.Deprecated('Use healthResponseDescriptor instead')
const HealthResponse$json = {
  '1': 'HealthResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
    {
      '1': 'checks',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.health.v1.HealthResponse.ChecksEntry',
      '10': 'checks'
    },
  ],
  '3': [HealthResponse_ChecksEntry$json],
};

@$core.Deprecated('Use healthResponseDescriptor instead')
const HealthResponse_ChecksEntry$json = {
  '1': 'ChecksEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `HealthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthResponseDescriptor = $convert.base64Decode(
    'Cg5IZWFsdGhSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIYCgd2ZXJzaW9uGAIgAS'
    'gJUgd2ZXJzaW9uEj0KBmNoZWNrcxgDIAMoCzIlLmhlYWx0aC52MS5IZWFsdGhSZXNwb25zZS5D'
    'aGVja3NFbnRyeVIGY2hlY2tzGjkKC0NoZWNrc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBX'
    'ZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
