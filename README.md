<div align="center">

<img src="assets/images/logo.png" alt="Flutter gRPC Starter logo" width="96" />

# Flutter gRPC Starter

**A production-grade Flutter template for Android and iOS.**

Start every mobile project on solid ground: flavors, opaque-token sessions, bloc state management, routing, theming, l10n, push notifications, crash reporting, device services, animations, and quality tooling, all wired and verified.

![Flutter](https://img.shields.io/badge/Flutter-3.44-45cdf5?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.12-0175C2?logo=dart&logoColor=white)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-333)
![Lints](https://img.shields.io/badge/style-very__good__analysis-B22C89)

</div>

> [!TIP]
> This repository is a template. Open it with Claude Code and run the `project-setup` skill, or use the `/project-setup` prompt with GitHub Copilot, to rename, rebrand, and configure a fresh project in minutes. The [customization guide](docs/CUSTOMIZATION.md) covers every knob in detail, including the backend contracts.

## What is inside

| Area | Choice |
| --- | --- |
| State management | `flutter_bloc`: `SessionBloc`, `ThemeCubit`, `LocaleCubit` app-wide, a `Bloc`/`Cubit` per screen |
| Navigation | `go_router` with a session-driven redirect guard and deep link support |
| Networking | `grpc` over an HTTP/2 channel with generated service stubs, opaque token auth via `CallOptions` metadata with proactive expiry checks and single-flight refresh |
| Errors | Sealed `AppException` hierarchy and a hand-rolled `Result<T>`, no exceptions across layers |
| Device identity | Install id (UUID v4 in secure storage) plus app and device metadata on every call, device details sent as the `common.v1.DeviceInfo` message and stored with the backend session at sign in |
| App updates | Platform-native, no backend: Google Play in-app updates on Android, App Store version check with a dismissible prompt on iOS |
| Ratings | Native in-app review prompts, throttled by session count, app age, and prompt interval |
| DI | `get_it`, plain constructor injection |
| Storage | `shared_preferences` (cached) for settings, hardened `flutter_secure_storage` for tokens |
| Logging | Sink-based `AppLogger` with boxed, colored console output and Crashlytics forwarding |
| Crash reporting | Firebase Crashlytics: fatal handlers, breadcrumbs, non-fatal records, user id binding |
| Push | Firebase Cloud Messaging with `flutter_local_notifications` for foreground display |
| Permissions | `PermissionsService` baseline over `permission_handler`, localized denial errors |
| Media | `MediaPickerService` for gallery, camera, and document picking |
| Location | `LocationService` over `geolocator` with permission-aware `Result` API |
| Biometrics | Opt-in app lock over `local_auth`: settings toggle, locks on background, Face ID and fingerprint |
| Animations | Motion tokens, entrance/stagger/press widgets, Lottie with graceful fallback |
| Localization | ARB files in `assets/l10n`, generated with `flutter gen-l10n` (en, fr), `accept-language` metadata on every call |
| Theming | Material 3 seeded color scheme, light and dark, widget-state-aware component themes, semantic color extension, Cupertino-adaptive widgets |
| Security | No cleartext traffic, certificate pin scaffold, obfuscated release builds, device-bound keychain |
| Quality | `very_good_analysis`, `dart format`, opt-in git pre-commit hooks, GitHub Actions CI |

## Getting started

```sh
flutter pub get
flutter run --flavor dev --target lib/main_dev.dart
```

The dev flavor ships with `useFakeAuth: true`, so the app runs end to end (sign in, session, sign out) with no backend.

<details>
<summary><strong>All common commands</strong></summary>

```sh
make get          # fetch dependencies
make l10n         # regenerate localizations
make proto        # regenerate gRPC/protobuf Dart from proto/
make check        # format check + analyze
make run-dev      # run the dev flavor
make run-prod     # run the prod flavor
make apk          # prod release APK
make aab          # prod release app bundle
make ipa          # prod release IPA (macOS only)
make icons        # regenerate launcher icons
make splash       # regenerate native splash screens
make hooks        # enable the pre-commit hook
```

</details>

## Flavors

Two flavors, two entry points, zero leakage:

```text
dev   com.ibrahimasylla.grpcstarter.dev   lib/main_dev.dart    Flutter gRPC Starter Dev
prod  com.ibrahimasylla.grpcstarter       lib/main_prod.dart   Flutter gRPC Starter
```

Each entry point builds its own immutable `AppConfig` and imports only its own Firebase options file. Dart tree shaking guarantees that dev URLs, keys, and Firebase options never appear in the prod binary, and vice versa. On iOS the flavors map to the `dev` and `prod` schemes with `Debug/Release/Profile-<flavor>` configurations; on Android they are Gradle product flavors.

## Architecture

```text
lib/
├── main_dev.dart / main_prod.dart   flavor entry points
├── app/                             bootstrap, root widget, router, theme
├── core/                            config, di, error, l10n, logging,
│                                    network (gRPC + generated stubs),
│                                    session, storage, extensions
├── features/
│   ├── about/                       app name, version, licenses, rate app
│   ├── app_update/                  native in-app updates (Play and App Store)
│   ├── auth/                        sign in, session, token lifecycle
│   ├── home/
│   ├── security/                    biometric app lock
│   └── settings/                    theme and language preferences
├── services/                        crash reporting, device info, location,
│                                    media picking, permissions, push
│                                    notifications, review, store
└── shared/                          animations toolkit and reusable UI
    ├── animations/                  AppMotion, FadeSlideIn, TapScale, Lottie
    └── widgets/                     adaptive, buttons, feedback, loaders
```

The session flow is the backbone: the backend issues an opaque access token with an `expires_in` lifetime, `GrpcClient` attaches it as request metadata and refreshes stale tokens once for all concurrent calls (with an `unauthenticated` retry as fallback), `SessionManager` persists and rotates tokens through an injected refresher, `SessionBloc` exposes the session to the UI, and the router redirects based on it. A refresh failure ends the session gracefully with a localized notice, never a crash.

## Configuration checklist

- [ ] Run the `project-setup` skill (or follow `.claude/skills/project-setup/SKILL.md` manually)
- [ ] Set the gRPC host, port, and TLS flag in `lib/main_dev.dart` and `lib/main_prod.dart` (or override the dev flavor with `--dart-define=GRPC_HOST=... --dart-define=GRPC_PORT=... --dart-define=GRPC_TLS=...`)
- [ ] Point `proto/` at your backend's `.proto` sources and run `make proto`; the committed stubs target `github.com/isyll/go-grpc-starter`
- [ ] Review the backend contract described in [docs/CUSTOMIZATION.md](docs/CUSTOMIZATION.md)
- [ ] Set `appStoreId` in `lib/main_prod.dart` once the app exists in App Store Connect (required for the iOS update and review prompts)
- [ ] `flutterfire configure` per flavor, paste into `lib/core/config/firebase/`, flip `configured` to `true`
- [ ] Replace `assets/branding/` images, then `make icons splash`
- [ ] Point deep link hosts at your domains (Gradle placeholders, iOS `DEEP_LINK_HOST`)
- [ ] Review the iOS usage descriptions in `ios/Runner/Info.plist` and keep only the permissions your app requests
- [ ] Pin your API certificates in `android/app/src/main/res/xml/network_security_config.xml` before release
- [ ] Add `android/key.properties` and a keystore for release signing
- [ ] `make hooks` to enable pre-commit checks
- [ ] Enable the GitHub Copilot coding agent on the repository (its environment setup workflow ships preconfigured)

## Notes on production services

- Crash reporting activates automatically in non-debug builds once Firebase is configured; collection stays off in debug and without Firebase options.
- Release builds via `make apk`, `make aab`, and `make ipa` are obfuscated with debug symbols split into `build/symbols`. Keep those symbols to deobfuscate Crashlytics stack traces.
- For native Android crash symbolication, the `google-services` and `firebase-crashlytics` Gradle plugins apply automatically once `android/app/google-services.json` is present, uploading the R8 mapping file to Crashlytics on release builds.

## Release checklist

Template defaults to verify or set before shipping a real build:

- **iOS push environment.** `ios/Runner/Runner.entitlements` pins `aps-environment` to `development`. Xcode rewrites it to `production` when it re-signs a distribution build with automatic signing, but confirm the archive carries `production` before uploading to TestFlight or the App Store.
- **Android release signing.** Provide `android/key.properties` and a keystore. Prod release builds now fail fast when it is missing instead of silently shipping a debug-signed binary.
- **Firebase configuration.** After `flutterfire configure`, flip `configured` to `true` in `lib/core/config/firebase/firebase_options_*.dart`; a prod launch logs a warning while it is still `false`, and the regenerated options replace the placeholder `iosBundleId`.
- **Crashlytics symbols.** Keep the Dart symbols from `build/symbols` to deobfuscate stack traces; native symbolication is wired through the Gradle plugins above.
- **iOS pods.** `ios/Podfile` pins the deployment target and trims unused `permission_handler` code; keep its permission flags in sync with the permissions the app actually requests.

## Release pipeline

Pushing a `v*` tag runs `.github/workflows/release.yml`: it verifies (format, analyze, test), then builds a signed Android app bundle and an iOS IPA, uploads both plus the debug symbols as artifacts, and optionally ships to Firebase App Distribution and App Store Connect. Configure these repository secrets before tagging a release:

| Secret | Purpose |
| --- | --- |
| `ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, `ANDROID_KEY_PASSWORD` | Android release signing |
| `IOS_DIST_CERT_BASE64`, `IOS_DIST_CERT_PASSWORD`, `IOS_PROVISIONING_PROFILE_BASE64`, `APPLE_TEAM_ID` | iOS distribution signing |
| `APP_STORE_CONNECT_KEY_ID`, `APP_STORE_CONNECT_ISSUER_ID`, `APP_STORE_CONNECT_API_KEY_BASE64` | App Store Connect upload (optional) |
| `FIREBASE_ANDROID_APP_ID`, `FIREBASE_SERVICE_ACCOUNT` | Firebase App Distribution (optional) |

## License

Released under the [MIT License](LICENSE) by [Ibrahima Sylla](https://github.com/isyll). Use it freely for personal and commercial projects.
