import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/app/demo_data.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/themes/compute_themes.dart';

enum ThemeType {
  custom,
  dynamic,
}

class ThemeProvider extends ChangeNotifier {
  ThemeType _themeType = ThemeType.dynamic;
  ThemeType get themeType => _themeType;
  set themeType(ThemeType v) {
    _themeType = v;
    notifyListeners();
  }

  MyDemoThemeData _customThemes = _buildThemes(
    primaryColor: Color(0xFF6750A4),
  );
  MyDemoThemeData get customThemes => _customThemes;
  set customThemes(MyDemoThemeData v) {
    _customThemes = v;
    notifyListeners();
  }

  Brightness _brightness = Brightness.light;
  Brightness get brightness => _brightness;

  ThemeData get themeData {
    final themes = _customThemes.getThemes();

    return _brightness == Brightness.light
        ? themes.light
        : themes.dark;
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
    print('primaryColor: $primaryColor');
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
  static MyDemoThemeData _buildThemes({
    required Color primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) => generateCustomThemes(
    primaryColor: primaryColor,
    secondaryColor: secondaryColor,
    tertiaryColor: tertiaryColor,
    neutralColor: neutralColor,
  );

  setThemesByAssetImage(String assetPath) async {
    try {
      final a = await computeBuildThemeFromImage(assetPath);
      print('seed: ${a.seed}');
      _customThemes = a;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

}