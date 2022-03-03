import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bt_business/presentation/styling/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

bool isDarkModeEnabled(AdaptiveThemeMode mode) {
  if (mode.isSystem) {
    final brightness = SchedulerBinding.instance!.window.platformBrightness;
    return brightness == Brightness.dark;
  } else {
    return mode.isDark;
  }
}

ButtonStyle primaryCTAButtonStyle(AdaptiveThemeMode mode) {
  return isDarkModeEnabled(mode)
      ? BTTheme.primaryCTAButtonStyleDark
      : BTTheme.primaryCTAButtonStyleLight;
}

ButtonStyle primaryOutlineButtonStyle(AdaptiveThemeMode mode) {
  return isDarkModeEnabled(mode)
      ? BTTheme.primaryOutlineButtonStyleDark
      : BTTheme.primaryOutlineButtonStyleLight;
}

void changeToggleThemeMode(BuildContext context) {
  if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) {
    AdaptiveTheme.of(context).setDark();
  } else {
    AdaptiveTheme.of(context).setLight();
  }
}

AdaptiveThemeMode themeMode(Object? mode) {
  if (mode == null) {
    return AdaptiveThemeMode.light;
  } else {
    return mode as AdaptiveThemeMode;
  }
}

ValueNotifier themeModeNotifier(BuildContext context) {
  return AdaptiveTheme.maybeOf(context)?.modeChangeNotifier ??
      ValueNotifier(AdaptiveThemeMode.system);
}
