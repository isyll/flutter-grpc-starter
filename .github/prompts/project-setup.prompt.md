---
mode: agent
description: Bootstrap a new app from the Flutter gRPC Starter template by renaming the project, packages, and bundle identifiers, configuring the gRPC host, deep links, Firebase, and branding.
---

Bootstrap a new app from this Flutter gRPC Starter template.

Collect from me before starting (ask if missing): app display name, project name (snake_case), organization package prefix (e.g. com.acme), dev and prod gRPC host/port/TLS, whether the backend `.proto` sources differ from the bundled go-grpc-starter contract, deep link hosts per flavor, whether Firebase/FCM is needed now, and the numeric App Store id if the app already exists in App Store Connect.

Then apply these steps:

1. Rename the Dart package: `name:` in `pubspec.yaml`, then every `package:flutter_grpc_starter/` import across `lib/`.
2. Rename the Android package: `namespace`, `applicationId`, and both `resValue("string", "app_name", ...)` entries in `android/app/build.gradle.kts`, move `MainActivity.kt` to the new package path and update its `package` declaration, and update `manifestPlaceholders["deepLinkHost"]` per flavor.
3. Rename the iOS bundle: all `PRODUCT_BUNDLE_IDENTIFIER` values in `ios/Runner.xcodeproj/project.pbxproj` (dev configs keep the `.dev` suffix), plus `APP_DISPLAY_NAME` and `DEEP_LINK_HOST` values. Update `CFBundleName` and the custom URL scheme in `ios/Runner/Info.plist`.
4. Update `lib/main_dev.dart` and `lib/main_prod.dart` (`appName`, the `grpc` `GrpcConfig` host/port/TLS, and `appStoreId` for prod when known; if the backend contract changed, update `proto/` and run `make proto`), and the Android custom scheme in `AndroidManifest.xml`. Reword the iOS usage descriptions in `ios/Runner/Info.plist` and update the pinning placeholder in `android/app/src/main/res/xml/network_security_config.xml` if pinning is enabled.
5. Update `appTitle` in `assets/l10n/app_en.arb` and `assets/l10n/app_fr.arb`, then run `flutter gen-l10n`.
6. Replace images in `assets/branding/` (same file names), update colors in `flutter_launcher_icons-*.yaml`, `flutter_native_splash.yaml`, and `lib/app/theme/app_colors.dart`, then run `dart run flutter_launcher_icons` and `dart run flutter_native_splash:create`.
7. If Firebase is needed, run `flutterfire configure` per flavor, paste the values into `lib/core/config/firebase/firebase_options_dev.dart` and `firebase_options_prod.dart`, and set `configured = true` in each.
8. Set `useFakeAuth: false` in `lib/main_dev.dart` once the real backend is reachable.
9. Update `.github/CODEOWNERS`, `README.md`, and `AGENTS.md` for the new project, then run `git config core.hooksPath .githooks`.
10. Verify with `flutter pub get`, `flutter analyze --no-pub` (zero issues required), and `flutter build apk --debug --flavor dev --target lib/main_dev.dart`.

Respect AGENTS.md conventions: no code comments, no em dashes, simple commit messages.
