import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_grpc_starter/core/config/grpc_config.dart';

final class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.grpc,
    this.appStoreId = '',
    this.firebaseOptions,
    this.useFakeAuth = false,
  });

  final AppFlavor flavor;
  final String appName;
  final GrpcConfig grpc;
  final String appStoreId;
  final FirebaseOptions? firebaseOptions;
  final bool useFakeAuth;

  bool get firebaseEnabled => firebaseOptions != null;
  bool get isDev => flavor == .dev;
  bool get isProd => flavor == .prod;
}

enum AppFlavor { dev, prod }
