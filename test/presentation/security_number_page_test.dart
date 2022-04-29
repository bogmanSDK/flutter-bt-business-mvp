import 'package:configuration/environment/env.dart';
import 'package:bt_business/keys.dart';
import 'package:bt_business/main.dart';
import 'package:bt_business/presentation/pages/security_number/security_number_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_app.dart';

void main() {
  group('Security Number Page', () {
    testWidgets('renders MaterialApp', (tester) async {
      Env.instance = SetupEnv();
      await tester.pumpApp(SecurityNumberPage());
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
    });

    testWidgets('renders SecurityNumberPage with Text and scaffold ', (WidgetTester tester) async {
      await tester.pumpApp(SecurityNumberPage());
      final securityNumberFinder = find.byKey(BTKeys.SECURITY_NUMBER_INPUT);
      final securityNumberConfirmFinder = find.byKey(BTKeys.SECURITY_NUMBER_CONFIRM_INPUT);

      expect(securityNumberFinder, findsOneWidget);
      expect(securityNumberConfirmFinder, findsOneWidget);
    });
  });
}
