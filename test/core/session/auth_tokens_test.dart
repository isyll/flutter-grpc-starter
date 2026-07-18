import 'package:flutter_grpc_starter/core/session/auth_tokens.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AuthTokens tokensExpiringIn(Duration duration) => .new(
    accessToken: 'a',
    refreshToken: 'r',
    expiresAt: .now().toUtc().add(duration),
  );

  test('never expires without an expiry timestamp', () {
    const tokens = AuthTokens(accessToken: 'a', refreshToken: 'r');

    expect(tokens.isExpired, isFalse);
    expect(tokens.expiresWithin(const .new(days: 365)), isFalse);
    expect(tokens.timeUntilExpiry, isNull);
  });

  test(
    'reports expired for a past timestamp',
    () => expect(tokensExpiringIn(const .new(hours: -1)).isExpired, isTrue),
  );

  test(
    'treats tokens inside the leeway window as expired',
    () => expect(tokensExpiringIn(const .new(seconds: 10)).isExpired, isTrue),
  );

  test(
    'reports valid outside the leeway window',
    () => expect(tokensExpiringIn(const .new(minutes: 5)).isExpired, isFalse),
  );

  test('expiresWithin looks ahead by the given duration', () {
    final tokens = tokensExpiringIn(const .new(minutes: 5));

    expect(tokens.expiresWithin(const .new(minutes: 10)), isTrue);
    expect(tokens.expiresWithin(const .new(minutes: 1)), isFalse);
  });

  test(
    'timeUntilExpiry clamps to zero once past',
    () => expect(
      tokensExpiringIn(const .new(hours: -1)).timeUntilExpiry,
      Duration.zero,
    ),
  );
}
