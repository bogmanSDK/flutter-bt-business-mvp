import 'package:bt_business/presentation/bloc/common/theme_bloc.dart';
import 'package:bt_business/presentation/route/router.dart';
import 'package:bt_business/presentation/styling/theme.dart';
import 'package:bt_business/presentation/widgets/loader/bt_loader.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bt_business/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class MainApp extends StatelessWidget {
  MainApp({this.adaptiveThemeMode});

  final AdaptiveThemeMode? adaptiveThemeMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return _MainAppLifecycleWidget(savedThemeMode: adaptiveThemeMode);
        },
      ),
    );
  }
}

class _MainAppLifecycleWidget extends StatefulWidget {
  const _MainAppLifecycleWidget({
    Key? key,
    this.savedThemeMode,
    this.theme,
  }) : super(key: key);

  final ThemeData? theme;
  final AdaptiveThemeMode? savedThemeMode;

  @override
  _MainAppLifecycleWidgetState createState() => _MainAppLifecycleWidgetState();
}

class _MainAppLifecycleWidgetState extends State<_MainAppLifecycleWidget>
    with WidgetsBindingObserver {
  List<NavigatorObserver> observers() => [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
      light: BTTheme.lightTheme,
      dark: BTTheme.darkTheme,
      builder: (theme, darkTheme) => MaterialApp.router(
        routerDelegate: router.delegate(navigatorObservers: observers),
        routeInformationParser: router.defaultRouteParser(),
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: BuildConfig.isDevelopment(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: BTLoader.init(),
      ),
    );
  }
}
