import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bt_business/di/injection/injection.dart';
import 'package:bt_business/presentation/main_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:configuration/environment/env.dart';

void main() => SetupEnv();

class SetupEnv extends Env {

  @override
  FutureOr<void> onCreate() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Future? onInjection() async {
    await Injection.inject();
  }

  @override
  Widget onCreateView(AdaptiveThemeMode? savedThemeMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    return MainApp(adaptiveThemeMode: savedThemeMode);
  }
}
