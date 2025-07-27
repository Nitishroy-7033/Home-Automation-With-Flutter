# Development Environment Configuration

## Project Information

- **Project Name**: Home Automation with Flutter
- **Flutter Version**: 3.32.6 (managed by FVM)
- **Minimum SDK**: Android 23, iOS 11.0

## Required Tools

- Flutter SDK 3.32.6 (via FVM)
- Android Studio / VS Code
- Android SDK API 34+
- Java 21+ / OpenJDK 21+
- Git

## Environment Variables

```bash
# Windows
set JAVA_HOME=C:\Program Files\Java\jdk-21
set ANDROID_HOME=C:\Users\%USERNAME%\AppData\Local\Android\sdk
set PATH=%PATH%;%USERPROFILE%\AppData\Local\Pub\Cache\bin

# macOS/Linux
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$HOME/.pub-cache/bin
```

## Development Workflow

### Initial Setup

1. Clone the repository
2. Run setup script: `./scripts/setup.bat` (Windows) or `./scripts/setup.sh` (Unix)
3. Open in VS Code or Android Studio

### Daily Development

```bash
# Start development
fvm flutter run

# Run tests
fvm flutter test

# Build for testing
fvm flutter build apk --debug
```

### Before Committing

```bash
# Clean and test
fvm flutter clean
fvm flutter pub get
fvm flutter analyze
fvm flutter test
```

## Build Configuration

- **Debug**: `fvm flutter build apk --debug`
- **Release**: `fvm flutter build apk --release`
- **Bundle**: `fvm flutter build appbundle --release`

## Dependencies Status

All major dependencies have been updated for compatibility:

- ✅ Syncfusion Charts: 26.2.14
- ✅ Firebase: Latest stable versions
- ✅ GetX: 4.7.2
- ✅ Flutter SVG: 2.2.0

## Gradle Configuration

- **Gradle Version**: 8.4
- **AGP Version**: 8.2.1
- **Kotlin Version**: 1.8.10
- **Minimum SDK**: 23
- **Target SDK**: 34

## Team Guidelines

1. Always use FVM commands (`fvm flutter ...`)
2. Never commit `.fvm/` directory
3. Keep `.fvmrc` in version control
4. Test builds before pushing
5. Update this file when adding new tools/dependencies
