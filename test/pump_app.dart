@Retry(10)
import 'package:bt_business/presentation/bloc/common/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bt_business/generated/l10n.dart';
import 'package:bt_business/presentation/widgets/loader/bt_loader.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (_, theme) {
            return MaterialApp(
              theme: theme,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: const Locale('en'),
              supportedLocales: S.delegate.supportedLocales,
              builder: BTLoader.init(),
              home: Scaffold(body: widget),
            );
          },
        ),
      ),
    );
    await pumpAndSettle();
  }
}
