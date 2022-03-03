import 'package:bt_business/presentation/styling/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(BTTheme.lightTheme);

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? BTTheme.lightTheme : BTTheme.darkTheme);
  }
}
