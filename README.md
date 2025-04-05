# Community Service App

A Flutter mobile application designed to connect users with community servers. This app allows users to browse and join various community servers categorized by interests such as sports, life, technologies, and entertainment.

## Features

- Browse community servers across different categories
- Filter servers by category (Sports, Life, Technologies, Entertainment)
- View detailed information about each server including member counts
- Create and manage user profiles
- Track which servers a user has joined
- Simple and intuitive navigation between screens

## Screenshots

(Screenshots will be added in the future)

## Requirements

- Flutter SDK: 3.0.0 or higher
- Dart SDK: 3.0.0 or higher
- Supported platforms: Android, iOS, Web

## Getting Started

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/G-N555/ai-driven-test.git
cd ai-driven-test
```

2. **Install dependencies**

```bash
flutter pub get
```

### Running the App

#### Development Mode

```bash
flutter run
```

This will run the app in debug mode on a connected device or emulator.

#### Web

```bash
flutter run -d chrome
```

#### Release Mode

```bash
flutter run --release
```

### Building the App

#### Android

```bash
flutter build apk
```

The built APK will be available at `build/app/outputs/flutter-apk/app-release.apk`.

#### iOS

```bash
flutter build ios
```

Note: For iOS builds, you'll need to use Xcode to archive and distribute the app.

#### Web

```bash
flutter build web
```

The built web app will be available in the `build/web` directory.

## Project Structure

```
├── lib/                        # Main source code
│   ├── main.dart               # Entry point of the application
│   ├── models/                 # Data models
│   │   ├── server.dart         # Server model definition
│   │   └── user_profile.dart   # UserProfile model definition
│   └── screens/                # UI screens
│       ├── profile_screen.dart # Profile management screen
│       └── servers_screen.dart # Server browsing screen
├── test/                       # Test files
```

## Testing

Run all tests:

```bash
flutter test
```

Run specific tests:

```bash
flutter test test/screens/main_screen_test.dart
```

## License

This project is licensed under the MIT License.
