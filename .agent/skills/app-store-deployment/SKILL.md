---
name: app-store-deployment
description: Mobile App Store deployment rules and configuration standards for iOS (App Store Connect) and Android (Google Play Console). Covers Info.plist, AndroidManifest, versioning, and privacy requirements.
---

# Mobile App Store Deployment Rules

> **NOTE:** If the user is beginning the deployment process, suggest they trigger the `/publish-mobile` workflow to track their progress.

This skill provides the mandatory configurations and pre-flight checks required before deploying a mobile application to the Apple App Store or Google Play Store. 

**Whenever a user asks to "prepare for release", "configure the app for production", or "deploy to the app store", you MUST enforce the following rules.**

## 1. Versioning Architecture

Both iOS and Android require a two-part versioning system: the user-facing version string and the internal build integer. You MUST increment the internal build integer on **every single upload**, even if the user-facing version remains the same.

### iOS (`Info.plist` or `app.json` / `pubspec.yaml`)
*   **Version Name (`CFBundleShortVersionString`):** User-facing (e.g., `1.0.3`). Update this for new features or major fixes.
*   **Build Number (`CFBundleVersion`):** Internal tracking (e.g., `9`). **MUST INCREMENT** for every binary sent to App Store Connect. Apple will reject duplicate build numbers.

### Android (`AndroidManifest.xml` or `app.json` / `pubspec.yaml`)
*   **Version Name (`versionName`):** User-facing (e.g., `1.0.3`).
*   **Version Code (`versionCode`):** Internal tracking (e.g., `6`). This MUST be a strictly increasing integer. Google Play will outright reject any `.aab` or `.apk` with a `versionCode` less than or equal to an already uploaded version.

## 2. Privacy & Permissions (Crucial for App Review)

App stores automatically scan your binary for permissions. If you request a permission but do not explain *why* or do not actually use it, you will be rejected.

### iOS (`Info.plist` & Privacy Manifests)
*   **Descriptions:** Any sensitive permission (Camera, Location, Photo Library) MUST have a highly descriptive string. 
    *   *Bad:* "We need your camera." 
    *   *Good:* "MindMint requires camera access to allow you to take and upload a profile picture."
*   **NSUserTrackingUsageDescription:** If using AdMob, Facebook Ads, or any cross-app tracking, this is **MANDATORY**. You must implement the App Tracking Transparency (ATT) prompt.
*   **Privacy Manifest (`PrivacyInfo.xcprivacy`):** Apple now strictly requires a Privacy Manifest detailing data collection practices and the use of Required Reason APIs (like `UserDefaults` or file timestamps). 

### Android (`AndroidManifest.xml`)
*   **Minimize Permissions:** Remove all default permissions your app doesn't actually need. Do not blindly include `READ_CONTACTS` or `ACCESS_FINE_LOCATION` unless it is a core feature.
*   **AdMob Application ID:** The `<meta-data android:name="com.google.android.gms.ads.APPLICATION_ID" .../>` MUST be present inside the `<application>` tag, or the app will crash on launch.

## 3. Signing and Security

*   **Android Keystore:** NEVER commit the `upload-keystore.jks` or `key.properties` files to public version control. Ensure they are in your `.gitignore`. If using an automated build system, inject these via secure environment variables.
*   **iOS Certificates:** Separate Development and Distribution certificates. Push notifications require an explicit setup in the Apple Developer Portal (Identifiers -> Push Notifications).

## 4. Pre-Flight Checklist Before Generating the Binary

Before running `flutter build appbundle` or `eas build -p all`:
1. [ ] Check that `versionCode` (Android) and `BuildNumber` (iOS) are incremented.
2. [ ] Verify that all API endpoints point to **PRODUCTION**, not `localhost` or staging.
3. [ ] Verify that AdMob units are using actual **PRODUCTION** IDs (test IDs will result in no revenue, missing the App ID will result in a crash).
4. [ ] Ensure RevenueCat is configured with the correct Public API keys for the production environment.
5. [ ] Remove all excessive `console.log()` or `print()` statements from the codebase to prevent memory leaks and performance degradation in production.
