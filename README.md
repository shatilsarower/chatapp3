# Chat Hub

![Chat Hub logo](images/chat1.png)

A simple real-time chat application built with Flutter and Firebase.

![Flutter](https://img.shields.io/badge/Flutter-Mobile%20App-02569B?logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Backend-Firebase-FFCA28?logo=firebase&logoColor=black)
![Cloud Firestore](https://img.shields.io/badge/Database-Cloud%20Firestore-FFCA28?logo=firebase&logoColor=black)

## Overview

**Chat Hub** is a lightweight chat application developed with Flutter. It uses Firebase Authentication for email-and-password authentication and Cloud Firestore to store and stream chat messages in real time.

The project demonstrates a basic authentication flow, Firebase integration, and a live messaging interface.

## Features

- **User registration:** Create an account using an email address and password.
- **User login:** Sign in with an existing Firebase Authentication account.
- **Real-time messaging:** Send messages and receive updates through a Cloud Firestore stream.
- **Message identification:** Display the sender's email address with each message.
- **Chat bubbles:** Align the current user's messages separately from messages sent by other users.
- **Loading indicator:** Show progress while authentication requests are running.
- **Animated welcome screen:** Display the Chat Hub branding with an animated text effect.

> **Current scope:** The app uses one shared `messages` collection. It does not currently implement private conversations, group management, media attachments, or push notifications.

## Technology Stack

| Technology / Package | Purpose |
| --- | --- |
| [Flutter](https://flutter.dev/) | Cross-platform UI framework |
| [Dart](https://dart.dev/) | Application programming language |
| [Firebase Core](https://pub.dev/packages/firebase_core) | Firebase integration |
| [Firebase Authentication](https://pub.dev/packages/firebase_auth) | Email-and-password authentication |
| [Cloud Firestore](https://pub.dev/packages/cloud_firestore) | Real-time message storage and streaming |
| [Animated Text Kit](https://pub.dev/packages/animated_text_kit) | Animated welcome-screen text |
| [Modal Progress HUD](https://pub.dev/packages/modal_progress_hud) | Authentication loading indicator |

## Project Structure

```text
chatapp3/
├── android/                 # Android platform project
├── ios/                     # iOS platform project
├── images/
│   └── chat1.png            # Chat Hub logo
├── lib/
│   ├── Components/
│   │   └── round_button.dart
│   ├── Screens/
│   │   ├── welcome_screen.dart
│   │   ├── login_screen.dart
│   │   ├── registration_screen.dart
│   │   └── chat_screen.dart
│   ├── constants.dart       # Shared UI styles and decorations
│   └── main.dart            # Application entry point and route setup
├── pubspec.yaml             # Flutter dependencies and asset configuration
└── README.md
```

## Getting Started

### Prerequisites

- Flutter SDK and Dart SDK compatible with this project's legacy dependencies
- Android Studio or another Flutter-compatible IDE
- An Android emulator or a physical Android device
- A Firebase project with Authentication and Cloud Firestore enabled

### 1. Clone the repository

```bash
git clone https://github.com/shatilsarower/chatapp3.git
cd chatapp3
```

### 2. Configure Firebase

This application requires Firebase configuration for the platform on which you want to run it.

1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Add an Android application to the Firebase project using the package name:

   ```text
   com.shatil.chatapp
   ```

3. Download the Android configuration file, `google-services.json`, and place it at:

   ```text
   android/app/google-services.json
   ```

4. In Firebase Authentication, enable the **Email/Password** sign-in provider.
5. Create or enable a **Cloud Firestore** database.
6. For iOS, register an iOS app in the same Firebase project, download `GoogleService-Info.plist`, and add it to `ios/Runner/` through Xcode.

The repository currently contains an Android Firebase configuration file associated with its original Firebase project. Replace it with your own project's configuration when using a separate Firebase project. Do not commit service-account private keys or other server-side credentials.

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

Start an emulator or connect a device, then run:

```bash
flutter run
```

## How It Works

### Authentication

The welcome screen provides navigation to the login and registration screens. Both screens use Firebase Authentication:

- Registration creates a Firebase user with an email address and password.
- Login authenticates an existing user.
- After successful authentication, the app navigates to the chat screen.

### Messaging

Messages are stored in the top-level Cloud Firestore collection named `messages`. Each message document currently contains these fields:

| Field | Type | Description |
| --- | --- | --- |
| `text` | String | Message content |
| `sender` | String | Email address of the sender |

The chat screen listens to the collection using a Firestore snapshot stream. When a new document is added, the stream updates the message list. Messages from the signed-in user's email are displayed as the current user's messages; other messages are displayed as incoming messages.

## Important Notes

### Legacy dependencies

This repository uses older Flutter and FlutterFire APIs, including `FirebaseUser`, `Firestore.instance`, and older Firestore query result properties. Its Android build files also use an older Android Gradle Plugin configuration.

**A recent Flutter SDK may not build this project without changes.** You may need to use a compatible older Flutter toolchain or migrate the dependencies and source code to current FlutterFire and Android Gradle APIs before building. The commands above describe the usual Flutter workflow; they are not a guarantee of compatibility with the latest SDK.

### Firestore security

The current implementation reads from and writes to the shared `messages` collection. It does not filter messages by conversation or verify membership in a chat room in the application code.

Before deploying or using this app with real users:

- Configure restrictive Firestore Security Rules.
- Validate authenticated users and message data on the backend.
- Add conversation or room membership checks if messages should not be visible to every signed-in user.
- Avoid using open rules such as `allow read, write: if true`.

This repository is best treated as a learning project or prototype, not a production-ready private messaging service.

## Possible Improvements

- Add private one-to-one conversations.
- Add user profiles and display names.
- Add message timestamps and delivery/read status.
- Add message validation and user-friendly error handling.
- Add sign-out functionality.
- Migrate to current Flutter and FlutterFire APIs.
- Add automated tests and production-grade Firestore Security Rules.

## Author

**Shatil Sarower**

- GitHub: [@shatilsarower](https://github.com/shatilsarower)
- Project repository: [chatapp3](https://github.com/shatilsarower/chatapp3)

---

Built with Flutter and Firebase.
