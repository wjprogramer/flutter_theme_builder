import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/demo_data.dart';
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

  static Themes _buildThemes({
    required Color primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) {
    if (kDebugMode) {
      return demoData1();
    }


    final lightScheme = Scheme.light(primaryColor.value);
    final darkScheme = Scheme.dark(primaryColor.value);

    // ColorScheme.fromSwatch(
    //
    // );
    //
    // final lightScheme = Scheme.lightFromCorePalette(
    //   CorePalette(),
    // );
    // final darkScheme = Scheme.lightFromCorePalette(
    //
    // );

    return Themes(
      ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: primaryColor,
          secondary: secondaryColor,
          tertiary: tertiaryColor,
          onSurface: neutralColor,
          onBackground: neutralColor,
        ),
        // colorScheme: _convertToColorScheme(Brightness.light, lightScheme),
      ),
      ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: primaryColor,
          secondary: secondaryColor,
          tertiary: tertiaryColor,
          onSurface: neutralColor,
          onBackground: neutralColor,
        ),
        // colorScheme: _convertToColorScheme(Brightness.dark, darkScheme),
      ),
    );
  }

  static ColorScheme _convertToColorScheme(Brightness brightness, Scheme scheme) {
    return ColorScheme(
      brightness: brightness,
      primary: Color(scheme.primary),
      onPrimary: Color(scheme.onPrimary),
      primaryContainer: Color(scheme.primaryContainer),
      onPrimaryContainer: Color(scheme.onPrimaryContainer),
      secondary: Color(scheme.secondary),
      onSecondary: Color(scheme.onSecondary),
      secondaryContainer: Color(scheme.secondaryContainer),
      onSecondaryContainer: Color(scheme.onSecondaryContainer),
      tertiary: Color(scheme.tertiary),
      onTertiary: Color(scheme.onTertiary),
      tertiaryContainer: Color(scheme.tertiaryContainer),
      onTertiaryContainer: Color(scheme.onTertiaryContainer),
      error: Color(scheme.error),
      onError: Color(scheme.onError),
      errorContainer: Color(scheme.errorContainer),
      onErrorContainer: Color(scheme.onErrorContainer),
      background: Color(scheme.background),
      onBackground: Color(scheme.onBackground),
      surface: Color(scheme.surface),
      onSurface: Color(scheme.onSurface),
      surfaceVariant: Color(scheme.surfaceVariant),
      onSurfaceVariant: Color(scheme.onSurfaceVariant),
      outline: Color(scheme.outline),
      outlineVariant: Color(scheme.outlineVariant),
    );
  }

}