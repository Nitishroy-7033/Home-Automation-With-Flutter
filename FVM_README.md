# Flutter Version Management (FVM) Setup

This project uses FVM to manage Flutter versions, ensuring consistent development environment across all team members.

## 🚀 Quick Start

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) installed
- [Git](https://git-scm.com/) installed

### Setup Instructions

#### Windows

```bash
# Run the setup script
.\scripts\setup.bat
```

#### macOS/Linux

```bash
# Make the script executable
chmod +x scripts/setup.sh

# Run the setup script
./scripts/setup.sh
```

#### Manual Setup

```bash
# 1. Install FVM globally
dart pub global activate fvm

# 2. Install the Flutter version specified in .fvmrc
fvm install

# 3. Use the Flutter version for this project
fvm use

# 4. Get dependencies
fvm flutter pub get
```

## 📋 Available Commands

Once FVM is set up, use these commands instead of regular Flutter commands:

```bash
# Instead of 'flutter run'
fvm flutter run

# Instead of 'flutter build apk'
fvm flutter build apk

# Instead of 'flutter test'
fvm flutter test

# Instead of 'flutter pub get'
fvm flutter pub get

# Instead of 'flutter clean'
fvm flutter clean
```

## 🔧 FVM Commands

```bash
# List all installed Flutter versions
fvm list

# Install a specific Flutter version
fvm install 3.32.6

# Use a specific Flutter version for this project
fvm use 3.32.6

# Remove unused Flutter versions
fvm remove 3.19.0

# Show current Flutter version for this project
fvm flutter --version
```

## 📁 Project Structure

- `.fvmrc` - Contains the Flutter version configuration
- `.fvm/` - Contains the Flutter SDK (ignored in git)
- `.vscode/settings.json` - VS Code configuration for FVM

## 🎯 Benefits

1. **Version Consistency**: All team members use the same Flutter version
2. **Multiple Projects**: Different projects can use different Flutter versions
3. **Easy Switching**: Switch between Flutter versions per project
4. **No Global Conflicts**: Isolates Flutter versions per project
5. **CI/CD Ready**: Automated builds use consistent versions

## 🔄 Updating Flutter Version

To update the Flutter version for this project:

```bash
# Install new version
fvm install 3.33.0

# Switch to new version
fvm use 3.33.0

# Verify the change
fvm flutter --version
```

## 🏗️ Build Instructions

### Debug Build

```bash
fvm flutter build apk --debug
```

### Release Build

```bash
fvm flutter build apk --release
```

### Development

```bash
# Run on connected device
fvm flutter run

# Run with hot reload
fvm flutter run --hot
```

## 🛠️ VS Code Integration

The project is configured to automatically use FVM in VS Code. The `.vscode/settings.json` file contains:

```json
{
  "dart.flutterSdkPath": ".fvm/versions/3.32.6"
}
```

## 🧪 Testing

```bash
# Run all tests
fvm flutter test

# Run tests with coverage
fvm flutter test --coverage
```

## 📱 Platform Specific Builds

### Android

```bash
# Debug APK
fvm flutter build apk --debug

# Release APK
fvm flutter build apk --release

# App Bundle (for Play Store)
fvm flutter build appbundle --release
```

### iOS (macOS only)

```bash
# Debug build
fvm flutter build ios --debug

# Release build
fvm flutter build ios --release
```

## 🔍 Troubleshooting

### FVM not found

```bash
# Ensure Dart pub cache is in PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Or on Windows
set PATH=%PATH%;%USERPROFILE%\AppData\Local\Pub\Cache\bin
```

### VS Code not recognizing Flutter

1. Restart VS Code after FVM setup
2. Check `.vscode/settings.json` has correct path
3. Run "Flutter: Change SDK" command in VS Code

### Build issues

```bash
# Clean and rebuild
fvm flutter clean
fvm flutter pub get
fvm flutter build apk
```

## 📚 Additional Resources

- [FVM Documentation](https://fvm.app/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
