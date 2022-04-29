import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class Env {
  static late Env instance;

  // Database Config
  int dbVersion = 1;

  Env() {
    instance = this;
    _init();
  }

  void _init() async {
    await _configureDB();
    final StatefulWidget app = FutureBuilder(
      future: await _onCreate(),
      builder: (context, snapshot) {
        return onCreateView(null);
      },
    );
    runApp(app);
  }

  Future? onInjection();

  FutureOr<void> onCreate();

  Widget onCreateView(AdaptiveThemeMode? savedThemeMode);

  Future? _onCreate() async {
    WidgetsFlutterBinding.ensureInitialized();
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    await const MethodChannel('flavor').invokeMethod<String>('getFlavor').then(
      (String? flavor) async {
        BuildConfig.init(flavor: flavor);
      },
    ).catchError((error) {
      print(error);
      BuildConfig.init(flavor: 'development');
    });

    await onInjection();
    await onCreate();
    runApp(onCreateView(savedThemeMode));
  }

  Future<void> _configureDB() async {
    await Hive.initFlutter();
    //TODO Register hive adapters here
  }

  /// manually deleting everything from the boxes
  Future<void> _deleteAllDB() async {}
}
