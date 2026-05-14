# Mobile Publishing Tracker

Use this checklist to track your progress across the multi-day app store deployment process. Do not delete this file until the app is successfully live in both stores.

## Phase 1: Dashboard Setup (Human Tasks)
- [ ] **App Store Connect:** Create the iOS app record.
- [ ] **Google Play Console:** Create the Android app record.
- [ ] **RevenueCat:** Import products from Apple and Google.
- [ ] **RevenueCat:** Create an Entitlement (e.g., `pro_access`).
- [ ] **RevenueCat:** Create an Offering (e.g., `default_offering`) and attach products.
- [ ] **AdMob:** Create two distinct apps (`[App Name] iOS` and `[App Name] Android`).
- [ ] **AdMob:** Generate Ad Units for each platform.

## Phase 2: Codebase Wiring (AI Tasks)
- [ ] **AdMob App IDs:** Inject iOS App ID into `Info.plist` and Android App ID into `AndroidManifest.xml`.
- [ ] **AdMob Ad Units:** Implement platform-aware Ad Unit IDs in the Dart/React Native code.
- [ ] **RevenueCat Code:** Implement offering fetching and entitlement checking.
- [ ] **Paywall Compliance:** Implement Apple Guideline 3.1.2(c) requirements (Auto-renewal disclosure, Price, Cancel instructions, Legal Links).

## Phase 3: Privacy & Security (AI Tasks)
- [ ] **iOS Permissions:** Add highly descriptive strings for sensitive permissions in `Info.plist`.
- [ ] **iOS Privacy:** Implement `NSUserTrackingUsageDescription` (ATT prompt) if using AdMob.
- [ ] **iOS Manifest:** Generate `PrivacyInfo.xcprivacy` with required reason APIs.
- [ ] **Android Permissions:** Strip unnecessary default permissions from `AndroidManifest.xml`.

## Phase 4: Pre-flight Audit & Build (AI Tasks)
- [ ] **Endpoints:** Verify all API endpoints point to PRODUCTION.
- [ ] **AdMob Test IDs:** Ensure AdMob uses PRODUCTION IDs (remove test IDs).
- [ ] **RevenueCat Keys:** Ensure RevenueCat is using Public API keys for production.
- [ ] **Logs:** Strip excessive `print()` or `console.log()` statements.
- [ ] **Versioning:** Increment the internal build integer (iOS: `CFBundleVersion`, Android: `versionCode`).
- [ ] **Generate Build:** Trigger the CI/CD pipeline or run local build commands.
