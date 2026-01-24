# API Key Security Guide

Since this is a mobile/web application, your Google Maps API Key will eventually be shipped inside the app binary or visible in the web browser network traffic. This is normal for client-side keys.

## 1. The Best Protection: Google Cloud Console Restrictions
The most effective way to protect your key is to restrict **WHO** can use it and **WHERE** it can be used.

### step-by-step:
1. Go to the [Google Cloud Console Credentials Page](https://console.cloud.google.com/google/maps-apis/credentials).
2. Select your API Key.
3. Under **Application restrictions**, choose the platform:
   - **Android**: Add your package name `com.example.microdeed` and your SHA-1 certificate fingerprint.
   - **iOS**: Add your Bundle Identifier `com.example.microdeed`.
   - **Web**: Add your domain (e.g., `localhost:3000/*` for dev, `yourwebsite.com/*` for prod).
4. Under **API restrictions**:
   - Select **Restrict key**.
   - Select only the APIs this key needs (e.g., "Maps SDK for Android", "Maps SDK for iOS", "Maps JavaScript API").

**Why this works**: Even if someone steals your key, they cannot use it because requests coming from their app/website will be rejected by Google.

---

## 2. Source Code Protection (Git)
You should not commit your real key to GitHub.

### What we have done already:
- We added `.env` to `.gitignore`. This keeps your key safe on your local machine if you put it there.

### What you must do before Committing:
1. **Native Files**: We manually pasted the key into `AndroidManifest.xml`, `AppDelegate.swift`, and `web/index.html` to make the app run.
2. **Before you push**: Go to those files and revert the key to a placeholder like `YOUR_API_KEY`.
   - `android/app/src/main/AndroidManifest.xml`
   - `ios/Runner/AppDelegate.swift`
   - `web/index.html`

### Advanced: Injecting Keys at Build Time
For a professional setup (CI/CD), you would use `dart-define` or Gradle scripts to inject the key from a secure secret store, so you never have to paste it into the files.

## 3. Fixing "BillingNotEnabled" Error
The error you saw (`BillingNotEnabledMapError`) means your Google Cloud Project does not have a billing account linked.
1. Go to Google Cloud Console.
2. Navigate to **Billing**.
3. Link a credit card/billing account to your project.
   *Note: Google offers a $200 free monthly credit, so you likely won't pay anything for development, but a card is required to activate the service.*
