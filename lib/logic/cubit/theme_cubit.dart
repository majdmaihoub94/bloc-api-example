import 'package:bloc/bloc.dart';
import 'package:bloc_example/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)) {
    updateAppTheme();
  }

  void updateAppTheme() {
    final Brightness currentBrightness = AppTheme.currentSystemBrightness;
    currentBrightness == Brightness.light
        ? _setTheme(ThemeMode.dark)
        : _setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColor(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
