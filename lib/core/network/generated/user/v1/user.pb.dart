// This is a generated file - do not edit.
//
// Generated from user/v1/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UpdateMeRequest extends $pb.GeneratedMessage {
  factory UpdateMeRequest({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? bio,
    $core.String? avatar,
  }) {
    final result = create();
    if (firstName != null) result.firstName = firstName;
    if (lastName != null) result.lastName = lastName;
    if (bio != null) result.bio = bio;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  UpdateMeRequest._();

  factory UpdateMeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateMeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateMeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firstName')
    ..aOS(2, _omitFieldNames ? '' : 'lastName')
    ..aOS(3, _omitFieldNames ? '' : 'bio')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMeRequest copyWith(void Function(UpdateMeRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateMeRequest))
          as UpdateMeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMeRequest create() => UpdateMeRequest._();
  @$core.override
  UpdateMeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateMeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateMeRequest>(create);
  static UpdateMeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get bio => $_getSZ(2);
  @$pb.TagNumber(3)
  set bio($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBio() => $_has(2);
  @$pb.TagNumber(3)
  void clearBio() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);
}

class GetUserRequest extends $pb.GeneratedMessage {
  factory GetUserRequest({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetUserRequest._();

  factory GetUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest copyWith(void Function(GetUserRequest) updates) =>
      super.copyWith((message) => updates(message as GetUserRequest))
          as GetUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  @$core.override
  GetUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

enum UploadAvatarRequest_Data { contentType, chunk, notSet }

class UploadAvatarRequest extends $pb.GeneratedMessage {
  factory UploadAvatarRequest({
    $core.String? contentType,
    $core.List<$core.int>? chunk,
  }) {
    final result = create();
    if (contentType != null) result.contentType = contentType;
    if (chunk != null) result.chunk = chunk;
    return result;
  }

  UploadAvatarRequest._();

  factory UploadAvatarRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadAvatarRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UploadAvatarRequest_Data>
      _UploadAvatarRequest_DataByTag = {
    1: UploadAvatarRequest_Data.contentType,
    2: UploadAvatarRequest_Data.chunk,
    0: UploadAvatarRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadAvatarRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOS(1, _omitFieldNames ? '' : 'contentType')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadAvatarRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadAvatarRequest copyWith(void Function(UploadAvatarRequest) updates) =>
      super.copyWith((message) => updates(message as UploadAvatarRequest))
          as UploadAvatarRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadAvatarRequest create() => UploadAvatarRequest._();
  @$core.override
  UploadAvatarRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadAvatarRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadAvatarRequest>(create);
  static UploadAvatarRequest? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  UploadAvatarRequest_Data whichData() =>
      _UploadAvatarRequest_DataByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearData() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get contentType => $_getSZ(0);
  @$pb.TagNumber(1)
  set contentType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContentType() => $_has(0);
  @$pb.TagNumber(1)
  void clearContentType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunk => $_getN(1);
  @$pb.TagNumber(2)
  set chunk($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunk() => $_clearField(2);
}

class UploadAvatarResponse extends $pb.GeneratedMessage {
  factory UploadAvatarResponse({
    $core.String? avatarUrl,
  }) {
    final result = create();
    if (avatarUrl != null) result.avatarUrl = avatarUrl;
    return result;
  }

  UploadAvatarResponse._();

  factory UploadAvatarResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadAvatarResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadAvatarResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'avatarUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadAvatarResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadAvatarResponse copyWith(void Function(UploadAvatarResponse) updates) =>
      super.copyWith((message) => updates(message as UploadAvatarResponse))
          as UploadAvatarResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadAvatarResponse create() => UploadAvatarResponse._();
  @$core.override
  UploadAvatarResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadAvatarResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadAvatarResponse>(create);
  static UploadAvatarResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get avatarUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set avatarUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAvatarUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvatarUrl() => $_clearField(1);
}

class RegisterPushTokenRequest extends $pb.GeneratedMessage {
  factory RegisterPushTokenRequest({
    $core.String? deviceId,
    $core.String? token,
    $core.String? platform,
    $core.String? appVersion,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (token != null) result.token = token;
    if (platform != null) result.platform = platform;
    if (appVersion != null) result.appVersion = appVersion;
    return result;
  }

  RegisterPushTokenRequest._();

  factory RegisterPushTokenRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterPushTokenRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterPushTokenRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOS(3, _omitFieldNames ? '' : 'platform')
    ..aOS(4, _omitFieldNames ? '' : 'appVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterPushTokenRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterPushTokenRequest copyWith(
          void Function(RegisterPushTokenRequest) updates) =>
      super.copyWith((message) => updates(message as RegisterPushTokenRequest))
          as RegisterPushTokenRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterPushTokenRequest create() => RegisterPushTokenRequest._();
  @$core.override
  RegisterPushTokenRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterPushTokenRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterPushTokenRequest>(create);
  static RegisterPushTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get platform => $_getSZ(2);
  @$pb.TagNumber(3)
  set platform($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPlatform() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlatform() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get appVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set appVersion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAppVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearAppVersion() => $_clearField(4);
}

class NotificationPreferences extends $pb.GeneratedMessage {
  factory NotificationPreferences({
    $core.bool? push,
    $core.bool? email,
    $core.bool? marketing,
    $core.bool? quietHoursEnabled,
    $core.String? quietHoursStart,
    $core.String? quietHoursEnd,
    $core.String? timezone,
  }) {
    final result = create();
    if (push != null) result.push = push;
    if (email != null) result.email = email;
    if (marketing != null) result.marketing = marketing;
    if (quietHoursEnabled != null) result.quietHoursEnabled = quietHoursEnabled;
    if (quietHoursStart != null) result.quietHoursStart = quietHoursStart;
    if (quietHoursEnd != null) result.quietHoursEnd = quietHoursEnd;
    if (timezone != null) result.timezone = timezone;
    return result;
  }

  NotificationPreferences._();

  factory NotificationPreferences.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotificationPreferences.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotificationPreferences',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'push')
    ..aOB(2, _omitFieldNames ? '' : 'email')
    ..aOB(3, _omitFieldNames ? '' : 'marketing')
    ..aOB(4, _omitFieldNames ? '' : 'quietHoursEnabled')
    ..aOS(5, _omitFieldNames ? '' : 'quietHoursStart')
    ..aOS(6, _omitFieldNames ? '' : 'quietHoursEnd')
    ..aOS(7, _omitFieldNames ? '' : 'timezone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationPreferences clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationPreferences copyWith(
          void Function(NotificationPreferences) updates) =>
      super.copyWith((message) => updates(message as NotificationPreferences))
          as NotificationPreferences;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationPreferences create() => NotificationPreferences._();
  @$core.override
  NotificationPreferences createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotificationPreferences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotificationPreferences>(create);
  static NotificationPreferences? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get push => $_getBF(0);
  @$pb.TagNumber(1)
  set push($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPush() => $_has(0);
  @$pb.TagNumber(1)
  void clearPush() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get email => $_getBF(1);
  @$pb.TagNumber(2)
  set email($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get marketing => $_getBF(2);
  @$pb.TagNumber(3)
  set marketing($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMarketing() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarketing() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get quietHoursEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set quietHoursEnabled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuietHoursEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuietHoursEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get quietHoursStart => $_getSZ(4);
  @$pb.TagNumber(5)
  set quietHoursStart($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQuietHoursStart() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuietHoursStart() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get quietHoursEnd => $_getSZ(5);
  @$pb.TagNumber(6)
  set quietHoursEnd($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasQuietHoursEnd() => $_has(5);
  @$pb.TagNumber(6)
  void clearQuietHoursEnd() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get timezone => $_getSZ(6);
  @$pb.TagNumber(7)
  set timezone($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTimezone() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimezone() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
