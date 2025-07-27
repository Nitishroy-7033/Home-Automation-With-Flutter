#!/bin/bash

echo "Setting up Flutter project with FVM..."
echo

# Check if FVM is installed
if ! command -v fvm &> /dev/null; then
    echo "FVM is not installed. Installing FVM..."
    dart pub global activate fvm
    echo "FVM installed successfully!"
fi

# Install Flutter version specified in .fvmrc
echo "Installing Flutter version from .fvmrc..."
fvm install

# Use the Flutter version for this project
echo "Setting up Flutter version for this project..."
fvm use

# Get dependencies
echo "Getting Flutter dependencies..."
fvm flutter pub get

echo
echo "Setup complete! You can now use:"
echo "  fvm flutter run"
echo "  fvm flutter build apk"
echo "  fvm flutter test"
echo
