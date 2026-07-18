import 'package:flutter_grpc_starter/app/bootstrap.dart';
import 'package:flutter_grpc_starter/core/config/firebase/firebase_options_dev.dart';

Future<void> main() {
  const host = String.fromEnvironment(
    'GRPC_HOST',
    defaultValue: 'api.dev.example.com',
  );
  const port = int.fromEnvironment('GRPC_PORT', defaultValue: 443);
  const useTls = bool.fromEnvironment('GRPC_TLS', defaultValue: true);

  return bootstrap(
    .new(
      flavor: .dev,
      appName: 'Flutter gRPC Starter Dev',
      grpc: const .new(host: host, port: port, useTls: useTls),
      firebaseOptions: DevFirebaseOptions.currentPlatformOrNull,
      useFakeAuth: true,
    ),
  );
}
