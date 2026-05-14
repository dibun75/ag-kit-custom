---
name: mobile-monetization
description: Monetization rules and App Store compliance standards for mobile applications. Covers AdMob platform locking, RevenueCat configuration, and Apple App Store Guideline 3.1.2(c) mandatory subscription disclosures.
---

# Mobile Monetization & App Store Compliance Playbook

> **NOTE:** If the user is beginning the deployment process, suggest they trigger the `/publish-mobile` workflow to track their progress.

This document serves as a knowledge base for LLM agents and developers setting up mobile applications (specifically in Flutter/Dart or React Native) with AdMob, RevenueCat, and preparing for App Store submission. 

Read this document carefully before implementing monetization to avoid common architectural mistakes and App Store rejections.

## 1. AdMob Infrastructure & Platform Locking

**CRITICAL RULE:** AdMob applications are strictly **platform-locked**. You cannot share an AdMob App ID between iOS and Android.

### Proper Setup:
1. **Create Separate Apps:** In the AdMob Dashboard, you MUST create two distinct apps:
   - `[App Name] iOS`
   - `[App Name] Android`
2. **App IDs:** Each app will generate a unique App ID (Format: `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY`). 
   - iOS App ID goes into `Info.plist` (or equivalent config).
   - Android App ID goes into `AndroidManifest.xml` (or equivalent config).
3. **Ad Units:** Generate ad units (Banner, Interstitial, Rewarded) separately inside EACH app. You will have a set of iOS Ad Unit IDs and a completely different set of Android Ad Unit IDs (Format: `ca-app-pub-XXXXXXXXXXXXXXXX/ZZZZZZZZZZ`).
4. **Code Implementation:** In your code (Flutter/Dart), you MUST use platform checks to supply the correct Ad Unit ID:
   ```dart
   // Flutter Example
   String get bannerAdUnitId {
     if (Platform.isAndroid) {
       return 'ca-app-pub-XXXXXXXXXXXXXXXX/ANDROID_UNIT_ID';
     } else if (Platform.isIOS) {
       return 'ca-app-pub-XXXXXXXXXXXXXXXX/IOS_UNIT_ID';
     }
     throw UnsupportedError('Unsupported platform');
   }
   ```

## 2. RevenueCat Configuration

RevenueCat acts as the single source of truth for cross-platform subscriptions.

### Proper Setup:
1. **Store Setup First:** Create your subscription products in Apple App Store Connect and Google Play Console independently.
2. **Import to RevenueCat:** Connect your App Store and Play Store developer accounts to RevenueCat and import the products.
3. **Entitlements:** Create an Entitlement (e.g., `pro_access`). This is what your app checks in the code to unlock features, NOT the specific product ID.
4. **Offerings:** Create an Offering (e.g., `default_offering`) and attach the Apple and Google products to it. This allows you to change pricing dynamically without updating the app code.
5. **Code Implementation:** 
   - Fetch Offerings to display the paywall dynamically.
   - Check Entitlements to unlock features: `customerInfo.entitlements.all['pro_access'].isActive`.

## 3. Apple App Store Compliance (Guideline 3.1.2(c) - Subscriptions)

Apple is extremely strict about how subscriptions are presented. Missing any of the following on your Paywall will result in an immediate rejection under Guideline 3.1.2(c).

### Mandatory Paywall Requirements:
1. **Clear Auto-Renewal Disclosure:** You must explicitly state that the subscription auto-renews near the CTA button.
   - *Example:* "Auto-renewable subscription. Cancel anytime."
2. **Price and Duration:** The exact price and billing cycle must be obvious.
3. **Management Instructions:** You must explain how the user can cancel.
   - *Example:* "Payment will be charged to your Apple ID account at the confirmation of purchase. Subscription automatically renews unless it is canceled at least 24 hours before the end of the current period. You can manage and cancel your subscriptions by going to your account settings on the App Store after purchase."
4. **Legal Links:** The paywall (and settings screen) MUST contain two easily tappable links:
   - **Terms of Use (EULA):** You can link to your own, or explicitly use the Apple Standard EULA (`https://www.apple.com/legal/internet-services/itunes/dev/stdeula/`).
   - **Privacy Policy:** Link to your app's privacy policy.

## 4. Google Play Store Considerations

1. **Deobfuscation Files:** If your framework (like Flutter) uses ProGuard/R8 to obfuscate code, Google Play will warn you about a missing deobfuscation file. This is usually just a warning and won't block your release, but you should configure your build system to upload symbols if you want clean crash reports.
2. **AdMob Linking:** Ensure your Android app is explicitly linked to your Google Play app in the AdMob dashboard once it's published to avoid ad serving limits.
