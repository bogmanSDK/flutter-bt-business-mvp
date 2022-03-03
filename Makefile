check:
	flutter analyze && \
	flutter test

app:
	flutter build appbundle --flavor production -t lib/presentation/main_production.dart --release && \
	open build/app/outputs/bundle/productionRelease/

apk:
	flutter build apk --flavor production -t lib/presentation/main_production.dart --profile && \
	open build/app/outputs/flutter-apk/

apk-test:
	flutter build apk --flavor qatest -t lib/presentation/main_qatest.dart --profile && \
	open build/app/outputs/flutter-apk/

apk-stg:
	flutter build apk --flavor staging -t lib/presentation/main_staging.dart --profile && \
	open build/app/outputs/flutter-apk/

apk-dev:
	flutter build apk --flavor development -t lib/presentation/main_development.dart --profile

open_ipa_archive:
	open build/ios/archive/Runner.xcarchive

ipa:
	flutter build ipa --flavor production -t lib/presentation/main_production.dart --release && \
	open build/ios/archive/Runner.xcarchive

ipa-dev:
	flutter build ipa --flavor development -t lib/presentation/main_development.dart --release && \
	open build/ios/archive/Runner.xcarchive

ipa-test:
	flutter build ipa --flavor qatest -t lib/presentation/main_qatest.dart --release && \
	open build/ios/archive/Runner.xcarchive

ipa-stg:
	flutter build ipa --flavor staging -t lib/presentation/main_staging.dart --release && \
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
