@echo off
echo Building Home Automation Flutter App...
echo.

echo Cleaning previous builds...
fvm flutter clean

echo Getting dependencies...
fvm flutter pub get

echo Building debug APK...
fvm flutter build apk --debug

if %errorlevel% equ 0 (
    echo.
    echo ✅ Build successful!
    echo APK location: build\app\outputs\flutter-apk\app-debug.apk
) else (
    echo.
    echo ❌ Build failed!
    exit /b 1
)

pause
