import 'package:flutter_grpc_starter/core/network/generated/auth/v1/auth.pb.dart'
    as authpb;
import 'package:flutter_grpc_starter/core/network/generated/common/v1/common.pb.dart'
    as commonpb;
import 'package:flutter_grpc_starter/core/network/grpc_client.dart';
import 'package:flutter_grpc_starter/core/network/grpc_error_mapper.dart';
import 'package:flutter_grpc_starter/core/session/auth_tokens.dart';
import 'package:flutter_grpc_starter/features/auth/domain/user.dart';
import 'package:flutter_grpc_starter/services/device/device_info.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

abstract interface class AuthApi {
  Future<User> fetchProfile();

  Future<SignInResult> signIn({
    required String email,
    required String password,
    required DeviceInfo device,
  });

  Future<void> signOut();

  Future<AuthTokens> refreshTokens(String refreshToken);
}

final class GrpcAuthApi implements AuthApi {
  const GrpcAuthApi({required this._client});

  final GrpcClient _client;

  @override
  Future<User> fetchProfile() =>
      _client.call(() => _client.user.getMe(Empty())).then(_userFromProto);

  @override
  Future<SignInResult> signIn({
    required String email,
    required String password,
    required DeviceInfo device,
  }) async {
    final pair = await _client.call(
      () => _client.auth.login(
        authpb.LoginRequest(
          email: email,
          password: password,
          device: _deviceToProto(device),
        ),
      ),
    );
    return .new(user: _userFromProto(pair.user), tokens: _tokensFromPair(pair));
  }

  @override
  Future<void> signOut() => _client.call(() => _client.auth.logout(Empty()));

  @override
  Future<AuthTokens> refreshTokens(String refreshToken) async {
    try {
      final pair = await _client.auth.refreshToken(
        authpb.RefreshTokenRequest(refreshToken: refreshToken),
      );
      return _tokensFromPair(pair);
    } on GrpcError catch (error) {
      throw mapGrpcError(error);
    }
  }
}

final class FakeAuthApi implements AuthApi {
  const FakeAuthApi();

  static const _demoUser = User(
    id: '1',
    email: 'demo@example.com',
    firstName: 'Demo',
    lastName: 'User',
    emailVerified: true,
  );

  @override
  Future<User> fetchProfile() async {
    await Future<void>.delayed(const .new(milliseconds: 200));
    return _demoUser;
  }

  @override
  Future<SignInResult> signIn({
    required String email,
    required String password,
    required DeviceInfo device,
  }) async {
    await Future<void>.delayed(const .new(milliseconds: 600));
    return .new(
      user: .new(
        id: '1',
        email: email,
        firstName: 'Demo',
        lastName: 'User',
        emailVerified: true,
      ),
      tokens: _fakeTokens(),
    );
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const .new(milliseconds: 200));
  }

  @override
  Future<AuthTokens> refreshTokens(String refreshToken) async {
    await Future<void>.delayed(const .new(milliseconds: 200));
    return _fakeTokens();
  }

  static AuthTokens _fakeTokens() => .new(
    accessToken: 'fake-access-${DateTime.now().millisecondsSinceEpoch}',
    refreshToken: 'fake-refresh-token',
    expiresAt: .now().toUtc().add(const .new(days: 3650)),
  );
}

final class SignInResult {
  const SignInResult({required this.user, required this.tokens});

  final User user;
  final AuthTokens tokens;
}

User _userFromProto(commonpb.User user) => .new(
  id: user.id,
  email: user.email,
  firstName: user.firstName,
  lastName: user.lastName,
  avatar: user.avatar.isEmpty ? null : user.avatar,
  bio: user.bio.isEmpty ? null : user.bio,
  status: user.status.isEmpty ? null : user.status,
  role: user.role.isEmpty ? null : user.role,
  emailVerified: user.emailVerified,
);

AuthTokens _tokensFromPair(commonpb.TokenPair pair) {
  final seconds = pair.expiresIn.toInt();
  return .new(
    accessToken: pair.accessToken,
    refreshToken: pair.refreshToken,
    expiresAt: seconds > 0
        ? DateTime.now().toUtc().add(.new(seconds: seconds))
        : null,
  );
}

commonpb.DeviceInfo _deviceToProto(DeviceInfo device) => commonpb.DeviceInfo(
  deviceId: device.deviceId,
  name: device.model,
  platform: device.platform,
  model: device.model,
  manufacturer: device.manufacturer,
);
