check:
	flutter analyze && \
	flutter test

app:
	flutter build appbundle --flavor production -t lib/presentation/main.dart --release && \
	open build/app/outputs/bundle/productionRelease/

apk:
	flutter build apk --flavor production -t lib/presentation/main.dart --profile && \
	open build/app/outputs/flutter-apk/

apk-dev:
	flutter build apk --flavor development -t lib/presentation/main.dart --profile

dev:
	flutter run -t lib/main.dart --debug --flavor development

prod:
	flutter run -t lib/main.dart --debug --flavor production

open_ipa_archive:
	open build/ios/archive/Runner.xcarchive

ipa:
	flutter build ipa --flavor production -t lib/presentation/main.dart --release && \
	open build/ios/archive/Runner.xcarchive

ipa-dev:
	flutter build ipa --flavor development -t lib/presentation/main.dart --release && \
	open build/ios/archive/Runner.xcarchive

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

l10n:
	flutter gen-l10n

regen:
	rm -f pubspec.lock && \
    rm -rf .dart_tool && \
    flutter pub get && \
    flutter pub run build_runner build --delete-conflicting-outputs

regen-ios:
	flutter clean && \
    rm ios/Podfile ios/Podfile.lock pubspec.lock && \
    rm -rf ios/Pods ios/Runner.xcworkspace && \
    flutter run
