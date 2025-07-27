@echo off
echo Setting up Flutter project with FVM...
echo.

REM Check if FVM is installed
fvm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo FVM is not installed. Installing FVM...
    dart pub global activate fvm
    echo FVM installed successfully!
)

REM Install Flutter version specified in .fvmrc
echo Installing Flutter version from .fvmrc...
fvm install

REM Use the Flutter version for this project
echo Setting up Flutter version for this project...
fvm use

REM Get dependencies
echo Getting Flutter dependencies...
fvm flutter pub get

echo.
echo Setup complete! You can now use:
echo   fvm flutter run
echo   fvm flutter build apk
echo   fvm flutter test
echo.
pause
