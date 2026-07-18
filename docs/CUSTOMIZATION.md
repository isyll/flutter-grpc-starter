# Customization guide

How to turn a fresh clone of Flutter gRPC Starter into your own app. Every section lists the exact files to touch, what the backend must provide, and the defaults you can keep.

> [!TIP]
> Most of this is automated. Open the repo with Claude Code and run the `project-setup` skill, or use the `/project-setup` prompt with GitHub Copilot. Come back here when you need to understand or adjust a single piece by hand.

## Checklist for a new project

- [ ] Rename the app, package, and bundle identifiers
- [ ] Set the gRPC host, port, and TLS flag
- [ ] Point `proto/` at your backend and regenerate the stubs
- [ ] Configure deep link scheme and hosts
- [ ] Wire Firebase per flavor (or skip it, everything degrades gracefully)
- [ ] Replace branding assets and regenerate icons and splash screens
- [ ] Set the App Store id for update and review flows
- [ ] Review the backend contract below (sign in device info, token pair)
- [ ] Harden for release (signing, certificate pinning)

## 1. Identity

| What | Where |
| --- | --- |
| Dart package name | `pubspec.yaml` (`name:`), then every `package:flutter_grpc_starter/` import |
| Display name | `appName` in `lib/main_dev.dart` and `lib/main_prod.dart`, `resValue` entries in `android/app/build.gradle.kts`, `APP_DISPLAY_NAME` in `ios/Runner.xcodeproj/project.pbxproj` |
| Android package | `namespace` and `applicationId` in `android/app/build.gradle.kts`, `MainActivity.kt` path and `package` declaration |
| iOS bundle id | `PRODUCT_BUNDLE_IDENTIFIER` values in `project.pbxproj` (dev configurations keep the `.dev` suffix) |
| App title (localized) | `appTitle` in `assets/l10n/app_en.arb` and `app_fr.arb`, then `flutter gen-l10n` |

## 2. gRPC configuration

Each flavor entry point builds an immutable `AppConfig` carrying a `GrpcConfig`:

```dart
AppConfig(
  flavor: .prod,
  appName: 'My App',
  grpc: GrpcConfig(host: 'api.example.com'),
  appStoreId: '1234567890',
)
```

`GrpcConfig` (`lib/core/config/grpc_config.dart`) holds the `host`, `port` (default `443`), and `useTls` (default `true`). The dev flavor reads `GRPC_HOST`, `GRPC_PORT`, and `GRPC_TLS` dart-defines so you can point it at a local backend without editing code:

```sh
flutter run --flavor dev --target lib/main_dev.dart \
  --dart-define=GRPC_HOST=10.0.2.2 \
  --dart-define=GRPC_PORT=8080 \
  --dart-define=GRPC_TLS=false
```

The API is defined by the `.proto` files in `proto/` and generated into `lib/core/network/generated/` with `buf generate` (`make proto`). The committed stubs target [`go-grpc-starter`](https://github.com/isyll/go-grpc-starter) and expose `AuthService`, `UserService`, `HealthService`, and `AdminService`, all reachable through `GrpcClient`. Point `proto/` at your own backend's sources and regenerate to change the contract.

### Metadata sent on every call

`GrpcClient` attaches these via `CallOptions` metadata providers (`lib/core/network/grpc_metadata.dart`):

| Key | Example | Source |
| --- | --- | --- |
| `authorization` | `Bearer 4fd6…` | Access token; omitted on public methods (login, register, refresh, verify, reset) |
| `x-app-version` | `1.4.2` | `package_info_plus` |
| `x-build-number` | `58` | `package_info_plus` |
| `x-platform` | `android` / `ios` | `device_info_plus` |
| `x-os-version` | `17.5` | `device_info_plus` |
| `x-device-id` | `4fd6…` (UUID v4) | Generated once, kept in secure storage |
| `accept-language` | `fr` | Locale setting, falls back to the system locale |

> [!NOTE]
> The device id is an install id: it is generated on first launch and survives app updates. On iOS it also survives reinstalls (keychain); on Android it resets when the user clears app data or reinstalls. No hardware identifier is ever read.

## 3. Backend contract

### Sign in with device info

`AuthService.Login` receives the credentials plus a `common.v1.DeviceInfo` message. The backend stores it with the server-side session so users can review and revoke devices later:

```proto
message DeviceInfo {
  string device_id = 1;
  string name = 2;
  string platform = 3;
  string model = 4;
  string manufacturer = 5;
}
```

A successful `Login`, `Register`, or `RefreshToken` returns a `common.v1.TokenPair` (`access_token`, `refresh_token`, `expires_in` seconds, and the `User`); the client derives the access-token expiry from `expires_in`. `SessionManager` refreshes through `AuthService.RefreshToken`, and `AuthRepository.refreshProfile` reads `UserService.GetMe`.

### Errors

Domain errors come back as a gRPC status whose message is already localized, enriched with `google.rpc.ErrorInfo` (a stable `reason` code such as `INVALID_CREDENTIALS`) and, for validation failures, `google.rpc.BadRequest` field violations. `mapGrpcError` turns these into the `AppException` hierarchy so the UI can react to the type and the machine-readable code.

### App updates

App updates are handled entirely by the platform stores and need nothing from your backend.

- **Android:** `AppUpdateService` runs [Google Play in-app updates](https://developer.android.com/guide/playcore/in-app-updates) through the `in_app_update` package. On launch and on resume (throttled to once per 6 hours) it asks Play whether an update is available and, when one is, starts the flexible flow (falling back to immediate). Play renders the prompt and the download UI itself. This only triggers for builds installed from Play (the store or an internal testing track), never for debug or sideloaded builds.
- **iOS:** there is no native in-app update API, so `AppUpdateService` queries Apple's public App Store lookup endpoint (`https://itunes.apple.com/lookup?bundleId=...`) for the published version and compares it with the installed one. When the store is ahead, `AppUpdateGate` shows a dismissible dialog once per version and remembers the version the user dismissed.

```mermaid
flowchart LR
    A[App launch or resume] --> B{Platform}
    B -->|Android| C[Google Play in-app update]
    B -->|iOS| D{App Store lookup}
    D -->|store version newer| E[Dismissible dialog<br/>once per version]
    D -->|up to date or request failed| F[Nothing]
    E -->|Update button| G[Store listing]
```

Opening the listing on iOS needs `appStoreId` (the numeric id from App Store Connect) on `AppConfig`; Android needs nothing.

## 4. Deep links

Configuration lives in three places:

| What | Where |
| --- | --- |
| Custom scheme | `<data android:scheme=…>` in `AndroidManifest.xml`, `CFBundleURLSchemes` in `ios/Runner/Info.plist` |
| HTTPS host per flavor | `manifestPlaceholders["deepLinkHost"]` in `android/app/build.gradle.kts`, `DEEP_LINK_HOST` in `project.pbxproj` |
| Route handling | `go_router` matches the path, the `redirect` guard sends unauthenticated users to sign in and back after login |

For verified HTTPS links you must also publish two files on each host:

<details>
<summary><strong>Android: assetlinks.json</strong></summary>

Serve at `https://app.example.com/.well-known/assetlinks.json`:

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.acme.myapp",
      "sha256_cert_fingerprints": ["AA:BB:…"]
    }
  }
]
```

Get the fingerprint with `keytool -list -v -keystore <keystore>` or from the Play Console (App signing).

</details>

<details>
<summary><strong>iOS: apple-app-site-association</strong></summary>

Serve at `https://app.example.com/.well-known/apple-app-site-association` with `Content-Type: application/json`:

```json
{
  "applinks": {
    "details": [
      {
        "appIDs": ["TEAMID.com.acme.myapp"],
        "components": [{ "/": "/*" }]
      }
    ]
  }
}
```

The associated domain (`applinks:app.example.com`) is derived from `DEEP_LINK_HOST` in the Runner entitlements.

</details>

## 5. Firebase

Run once per flavor and paste the generated values:

```sh
flutterfire configure   # select the dev project, copy into firebase_options_dev.dart
flutterfire configure   # select the prod project, copy into firebase_options_prod.dart
```

Set `configured = true` in each file. Without it the app runs fine: crash reporting and push notifications simply stay off.

## 6. Branding

1. Replace the images in `assets/branding/` (keep the file names).
2. Update the seed color in `lib/app/theme/app_colors.dart` and the colors in `flutter_launcher_icons-*.yaml` and `flutter_native_splash.yaml`.
3. Regenerate:

```sh
make icons splash
```

## 7. Localization

1. Add `assets/l10n/app_<code>.arb` with every key from `app_en.arb`.
2. Add the `Locale` to the language selector in `lib/features/settings/presentation/pages/settings_page.dart`.
3. Run `flutter gen-l10n`.

Every user-facing string goes through `context.l10n`; the compiler fails on missing keys, so an incomplete translation cannot ship silently.

## 8. Review prompts

`AppReviewService` asks for a store rating through the native in-app dialog. Defaults, all overridable in `lib/core/di/injector.dart`:

| Condition | Default |
| --- | --- |
| Minimum sessions | 5 |
| Minimum time since first session | 3 days |
| Minimum time between prompts | 90 days |

Sessions are counted by `AppLifecycleHandler` (cold start plus each return to the foreground), and the prompt is attempted when the app comes back to the foreground. For higher-quality reviews, also call `maybeRequestReview()` after a moment of success in your own features; the thresholds make repeated calls safe.

## 9. Release hardening

- [ ] Create a keystore and `android/key.properties` (gitignored)
- [ ] Pin your API certificates in `android/app/src/main/res/xml/network_security_config.xml`
- [ ] Keep `build/symbols` from `make apk` / `make aab` / `make ipa` to deobfuscate Crashlytics traces
- [ ] Verify the update flow end to end: on Android push a higher build to an internal testing track and confirm Play prompts to update; on iOS confirm the dialog appears once the App Store version is ahead of the installed one
