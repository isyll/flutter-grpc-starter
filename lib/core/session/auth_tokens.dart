import 'package:equatable/equatable.dart';

final class AuthTokens extends Equatable {
  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  static const expiryLeeway = Duration(seconds: 30);

  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  bool get isExpired => expiresWithin(.zero);

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresAt];

  Duration? get timeUntilExpiry {
    final expiry = expiresAt;
    if (expiry == null) return null;
    final remaining = expiry.difference(.now().toUtc());
    return remaining.isNegative ? .zero : remaining;
  }

  bool expiresWithin(Duration duration) {
    final expiry = expiresAt;
    if (expiry == null) return false;
    final threshold = expiry.subtract(expiryLeeway).subtract(duration);
    return !DateTime.now().toUtc().isBefore(threshold);
  }
}
