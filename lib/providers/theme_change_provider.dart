import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/app/demo_data.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/utils/utils.dart';

enum ThemeType {
  custom,
  dynamic,
}

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _dynamicThemes = Themes(
      ThemeData.light(useMaterial3: true),
      ThemeData.dark(useMaterial3: true),
    );
  }

  ThemeType _themeType = ThemeType.dynamic;
  ThemeType get themeType => _themeType;
  set themeType(ThemeType v) {
    _themeType = v;
    notifyListeners();
  }

  String _dynamicThemeImageSource = '';
  String get dynamicThemeImageSource => _dynamicThemeImageSource;

  late Themes _dynamicThemes;
  Themes get dynamicThemes => _dynamicThemes;

  MyDemoThemeData _customThemes = _buildThemes(
    primaryColor: Color(0xFFf77ebe),
  );
  MyDemoThemeData get customThemes => _customThemes;
  set customThemes(MyDemoThemeData v) {
    _customThemes = v;
    notifyListeners();
  }

  Brightness _brightness = Brightness.light;
  Brightness get brightness => _brightness;

  ThemeData get themeData {
    final themes = _currentThemes;
    // print(getPrettyJSONString(_customThemes.toJson()));

    return _brightness == Brightness.light
        ? themes.light
        : themes.dark;
  }

  Themes get _currentThemes {
    switch (themeType) {
      case ThemeType.dynamic:
        return _dynamicThemes;
      case ThemeType.custom:
        return _customThemes.getThemes();
    }
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
    List<MyCustomColor>? customColors,
  }) {
    print('primaryColor: $primaryColor');
    _customThemes = _buildThemes(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
      neutralColor: neutralColor,
      customColors: customColors,
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
    List<MyCustomColor>? customColors,
  }) => generateCustomThemes(
    primaryColor: primaryColor,
    secondaryColor: secondaryColor,
    tertiaryColor: tertiaryColor,
    neutralColor: neutralColor,
    customColors: customColors,
  );

  Future<void> setThemesByAssetImage(String imagePath) async {
    try {
      _dynamicThemes = await generateThemesFromImage(imagePath);
      _dynamicThemeImageSource = imagePath;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

}