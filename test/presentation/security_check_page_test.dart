import 'package:configuration/environment/env.dart';
import 'package:bt_business/keys.dart';
import 'package:bt_business/main.dart';
import 'package:bt_business/presentation/pages/security_check/security_check_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_app.dart';

void main() {
  group('Security Check Page', () {
    testWidgets('renders MaterialApp', (tester) async {
      Env.instance = SetupEnv();
      await tester.pumpApp(SecurityCheckPage());
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
    });
    testWidgets('renders SecurityCheckPage with Text and scaffold ',
        (WidgetTester tester) async {
      await tester.pumpApp(SecurityCheckPage());
      final securityPinFinder = find.byKey(BTKeys.SECURITY_ONE_OFF_CODE_INPUT);
      final nextButtonFinder = find.byKey(BTKeys.SECURITY_CHECK_NEXT_BUTTON);
      final cancelButtonFinder = find.byKey(BTKeys.SECURITY_CHECK_CANCEL_BUTTON);

      expect(securityPinFinder, findsOneWidget);
      expect(nextButtonFinder, findsOneWidget);
      expect(cancelButtonFinder, findsOneWidget);
    });
  });

  testWidgets('Showing error due to empty "One-off code" field', (WidgetTester tester) async {
    await tester.pumpApp(SecurityCheckPage());

    await tester.tap(find.byKey(BTKeys.SECURITY_CHECK_NEXT_BUTTON));
    await tester.pump(const Duration(milliseconds: 500));

    final nameError = find.text('Please enter the code received in SMS');
    expect(nameError, findsOneWidget);
  });

  testWidgets('Showing No error for "One-off code" field if entered', (WidgetTester tester) async {
    await tester.pumpApp(SecurityCheckPage());
    final nameWidget = find.byKey(BTKeys.SECURITY_ONE_OFF_CODE_INPUT);

    await tester.enterText(nameWidget, '45711');
    await tester.tap(find.byKey(BTKeys.SECURITY_CHECK_NEXT_BUTTON));

    await tester.pump(const Duration(milliseconds: 500));
    final nameError = find.text('Please enter the code received in SMS');
    expect(nameError, findsNothing);
  });
}
