final class GrpcConfig {
  const GrpcConfig({
    required this.host,
    this.port = 443,
    this.useTls = true,
  });

  final String host;
  final int port;
  final bool useTls;

  String get authority => '$host:$port';
}
