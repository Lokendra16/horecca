# the_horeca_store

A new Flutter project.

##  For intl localization run this command
flutter gen-l10n

##  For Generating build classes run this command
flutter packages pub run build_runner build --delete-conflicting-outputs

## Whenever you update flutter_native_splash.yaml run this command 
flutter pub run flutter_native_splash:create --path=lib/flutter_native_splash.yaml

## Combined Command
flutter pub get && flutter gen-l10n && flutter packages pub run build_runner build --delete-conflicting-outputs