# Microdeed

## Setup Instructions

This project uses Google Maps and requires an API Key.

### 1. Environment Variables
Copy the example environment file and add your API key:
```bash
cp .env.example .env
```
Open `.env` and replace `YOUR_API_KEY_HERE` with your actual Google Maps API Key.

### 2. Native Configuration
**Note**: For security, do not commit your actual API key in the following files. Use markers or environment injection if you have a CI/CD pipeline. For local development, you must manually insert the key or configure build variables.

#### Android
Open `android/app/src/main/AndroidManifest.xml` and update the `meta-data`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY_HERE"/>
```

#### iOS
Open `ios/Runner/AppDelegate.swift` and update the API Key:
```swift
GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
```

## Running the App
```bash
flutter run
```
