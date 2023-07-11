import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/app/demo_data.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

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

  Themes _customThemes = _buildThemes(
    primaryColor: Color(0xFF6750A4),
    secondaryColor: Color(0xFF625B71),
    tertiaryColor: Color(0xFF7D5260),
    neutralColor: Color(0xFF939094),
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
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) {
    _customThemes = _buildThemes(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
      neutralColor: neutralColor,
    );
    notifyListeners();
  }

  // NOTES:
  // 1. ColorScheme.fromSwatch
  // 2. Scheme.lightFromCorePalette
  // 3. Color primaryColor; Scheme.light(primaryColor.value);
  static Themes _buildThemes({
    required Color primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) {
    return generateCustomThemes(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
      neutralColor: neutralColor,
    );
  }

}