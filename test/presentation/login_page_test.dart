import 'package:configuration/environment/env.dart';
import 'package:bt_business/keys.dart';
import 'package:bt_business/main.dart';
import 'package:bt_business/presentation/pages/login/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_app.dart';

void main() {
  group('Login Page', () {
    testWidgets('renders MaterialApp', (tester) async {
      Env.instance = SetupEnv();
      await tester.pumpApp(LoginPage());
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
    });
    testWidgets('renders LoginPage with Text+key and 1 scaffold ',
        (WidgetTester tester) async {
      await tester.pumpApp(LoginPage());
      final nameFinder = find.byKey(BTKeys.LOGIN_USERNAME_INPUT);
      final passwordFinder = find.byKey(BTKeys.LOGIN_PASSWORD_INPUT);
      final actionButtonFinder = find.byKey(BTKeys.LOGIN_ACTION_BUTTON);

      expect(nameFinder, findsOneWidget);
      expect(passwordFinder, findsOneWidget);
      expect(actionButtonFinder, findsOneWidget);
    });
  });

  testWidgets('Showing error due to empty "Email" field', (WidgetTester tester) async {
    await tester.pumpApp(LoginPage());

    await tester.tap(find.byKey(BTKeys.LOGIN_ACTION_BUTTON));
    await tester.pump(const Duration(milliseconds: 500));

    final nameError = find.text('Invalid email address');
    expect(nameError, findsOneWidget);
  });

  testWidgets('Showing error due to empty "Password" field', (WidgetTester tester) async {
    await tester.pumpApp(LoginPage());

    await tester.tap(find.byKey(BTKeys.LOGIN_ACTION_BUTTON));

    await tester.pump(const Duration(milliseconds: 500));
    final passError = find.text('Please enter a password');
    expect(passError, findsOneWidget);
  });

  testWidgets('Showing 2 errors due to empty "Email" and "Password" field',
      (WidgetTester tester) async {
    await tester.pumpApp(LoginPage());
    final nameWidget = find.byKey(BTKeys.LOGIN_USERNAME_INPUT);
    final passwordWidget = find.byKey(BTKeys.LOGIN_PASSWORD_INPUT);

    await tester.enterText(nameWidget, '');
    await tester.enterText(passwordWidget, '');
    await tester.tap(find.byKey(BTKeys.LOGIN_ACTION_BUTTON));

    await tester.pump(const Duration(milliseconds: 500));
    final passError = find.text('Please enter a password');
    final nameError = find.text('Invalid email address');
    expect(passError, findsOneWidget);
    expect(nameError, findsOneWidget);
  });

  testWidgets('Showing an error for "Email" field if entered incorrect email address',
      (WidgetTester tester) async {
    await tester.pumpApp(LoginPage());
    final nameWidget = find.byKey(BTKeys.LOGIN_USERNAME_INPUT);

    await tester.enterText(nameWidget, 'SomeText');
    await tester.tap(find.byKey(BTKeys.LOGIN_ACTION_BUTTON));

    await tester.pump(const Duration(milliseconds: 500));
    final nameError = find.text('Invalid email address');
    expect(nameError, findsOneWidget);
  });

  testWidgets('Showing No error for "Email" field if entered', (WidgetTester tester) async {
    await tester.pumpApp(LoginPage());
    final nameWidget = find.byKey(BTKeys.LOGIN_USERNAME_INPUT);

    await tester.enterText(nameWidget, 'email@gmail.com');
    await tester.tap(find.byKey(BTKeys.LOGIN_ACTION_BUTTON));

    await tester.pump(const Duration(milliseconds: 500));
    final nameError = find.text('Invalid email address');
    expect(nameError, findsNothing);
  });

  testWidgets(
      'Showing No error for "Email" field if entered and for "Password" field'
      'when input is not empty', (WidgetTester tester) async {
    await tester.pumpApp(LoginPage());

    final emailWidget = find.byKey(BTKeys.LOGIN_USERNAME_INPUT);
    final passwordWidget = find.byKey(BTKeys.LOGIN_PASSWORD_INPUT);

    await tester.enterText(emailWidget, 'email@gmail.com');
    await tester.enterText(passwordWidget, 'asdASD123');
    await tester.tap(find.byKey(BTKeys.LOGIN_ACTION_BUTTON));

    await tester.pumpAndSettle(const Duration(seconds: 3));
    final passError = find.text('Please enter a password');
    final nameError = find.text('Invalid email address');
    await expectLater(passError, findsNothing);
    await expectLater(nameError, findsNothing);
  });
}
