import 'package:flutter_grpc_starter/app/bootstrap.dart';
import 'package:flutter_grpc_starter/core/config/firebase/firebase_options_dev.dart';

Future<void> main() {
  const apiOverride = String.fromEnvironment('API_BASE_URL');

  return bootstrap(
    .new(
      flavor: .dev,
      appName: 'Flutter gRPC Starter Dev',
      apiBaseUrl: apiOverride.isNotEmpty
          ? apiOverride
          : 'https://api.dev.example.com',
      firebaseOptions: DevFirebaseOptions.currentPlatformOrNull,
      useFakeAuth: true,
    ),
  );
}
