import 'package:flutter_grpc_starter/app/bootstrap.dart';
import 'package:flutter_grpc_starter/core/config/firebase/firebase_options_prod.dart';

Future<void> main() => bootstrap(
  .new(
    flavor: .prod,
    appName: 'Flutter gRPC Starter',
    grpc: const .new(host: 'api.example.com'),
    firebaseOptions: ProdFirebaseOptions.currentPlatformOrNull,
  ),
);
