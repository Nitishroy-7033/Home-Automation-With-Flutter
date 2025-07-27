# Flutter FVM PowerShell Profile Setup
# Add this to your PowerShell profile or run it in your development session

# Add Dart pub cache to PATH for current session
$env:PATH += ";$env:USERPROFILE\AppData\Local\Pub\Cache\bin"

# Flutter FVM Aliases for easier development
function Get-FlutterVersion { fvm flutter --version }
function Get-FVMList { fvm list }
function Start-FlutterApp { fvm flutter run }
function Build-FlutterAPK { fvm flutter build apk }
function Build-FlutterAPKRelease { fvm flutter build apk --release }
function Test-Flutter { fvm flutter test }
function Clean-Flutter { fvm flutter clean; fvm flutter pub get }
function Get-FlutterDeps { fvm flutter pub get }
function Update-FlutterDeps { fvm flutter pub upgrade }

# Aliases
Set-Alias -Name fflutter -Value "fvm flutter"
Set-Alias -Name frun -Value Start-FlutterApp
Set-Alias -Name fbuild -Value Build-FlutterAPK
Set-Alias -Name ftest -Value Test-Flutter
Set-Alias -Name fclean -Value Clean-Flutter
Set-Alias -Name fget -Value Get-FlutterDeps

Write-Host "FVM Flutter aliases loaded successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Available commands:" -ForegroundColor Yellow
Write-Host "  frun          - Run Flutter app (fvm flutter run)"
Write-Host "  fbuild        - Build debug APK (fvm flutter build apk)"
Write-Host "  ftest         - Run tests (fvm flutter test)"
Write-Host "  fclean        - Clean and get dependencies"
Write-Host "  fget          - Get dependencies (fvm flutter pub get)"
Write-Host "  fflutter      - Direct FVM Flutter command"
Write-Host ""
Write-Host "FVM commands:" -ForegroundColor Yellow
Write-Host "  fvm list      - List installed Flutter versions"
Write-Host "  fvm install  - Install Flutter version from .fvmrc"
Write-Host "  fvm use       - Use Flutter version from .fvmrc"
Write-Host ""
