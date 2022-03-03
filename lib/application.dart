import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bt_business/presentation/bloc/auth/auth_cubit.dart';
import 'package:bt_business/presentation/bloc/common/theme_bloc.dart';
import 'package:bt_business/presentation/route/router.dart';
import 'package:bt_business/presentation/styling/theme.dart';
import 'package:bt_business/presentation/widgets/loader/bt_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'di/authentication_repository.dart';
import 'di/user_local_source.dart';
import 'domain/repositories/auth/authentication_repository.dart';
import 'package:bt_business/generated/l10n.dart';

abstract class Application {
  static late Application instance;

  // Database Config
  int dbVersion = 1;

  Application() {
    instance = this;
    _init();
  }

  bool get isDevelop;

  void _init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _configureDB();
    _initializeDependencies();
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    runApp(
      MainApp(
        adaptiveThemeMode: savedThemeMode,
        authenticationRepository: getAuthenticationRepository(),
      ),
    );
  }

  Future<void> _configureDB() async {
    await Hive.initFlutter();
    //TODO Register hive adapters here
  }

  void _initializeDependencies() {
    registerUserLocalSource();
    registerAuthenticationRepository();
    // TODO: initialize other IoC dependencies here
  }

  /// manually deleting everything from the boxes
  Future<void> _deleteAllDB() async {}
}

class MainApp extends StatelessWidget {
  MainApp({
    required this.authenticationRepository,
    this.adaptiveThemeMode,
  });

  final AuthenticationRepository authenticationRepository;
  final AdaptiveThemeMode? adaptiveThemeMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(authenticationRepository),
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
  // TODO: consider to remove/leave these observers
  List<NavigatorObserver> observers() => [
        /// we shouldn't log everything that is tapped and clicked
      ];

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
        debugShowCheckedModeBanner: Application.instance.isDevelop,
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
