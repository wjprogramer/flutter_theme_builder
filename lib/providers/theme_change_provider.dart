import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/themes.dart';

enum ThemeType {
  custom,
  dynamic,
}

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
  }

  ThemeType _themeType = ThemeType.dynamic;
  ThemeType get themeType => _themeType;
  set themeType(ThemeType v) {
    _themeType = v;
    notifyListeners();
  }

  Themes _customThemes = Themes(
    ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
    ),
    ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
    ),
  );
  Themes get customThemes => _customThemes;
  set customThemes(Themes v) {
    _customThemes = v;
    notifyListeners();
  }

  Brightness _brightness = Brightness.light;
  Brightness get brightness => _brightness;

  ThemeData get themeData {
    return _brightness == Brightness.light
        ? _customThemes.light
        : _customThemes.dark;
  }

  void toggleBrightness() {
    _brightness = _brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
    notifyListeners();
  }

  void setThemes({
    required Color primaryColor,
  }) {
    _customThemes = Themes(
      ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: primaryColor,
        ),
      ),
      ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: primaryColor,
        ),
      ),
    );
    notifyListeners();
  }

}