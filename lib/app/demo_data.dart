import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/utils/utils.dart';

Themes generateCustomThemes({
  required Color primaryColor,
  Color? secondaryColor,
  Color? tertiaryColor,
  Color? neutralColor,
}) {
  final coreColors = <String, String>{
    'primaryColor': hexFromArgb(primaryColor.value),
  };

  if (secondaryColor != null) { coreColors['secondary'] = hexFromArgb(secondaryColor.value); }
  if (tertiaryColor != null) { coreColors['tertiary'] = hexFromArgb(tertiaryColor.value); }
  if (neutralColor != null) { coreColors['neutral'] = hexFromArgb(neutralColor.value); }

  final themes = custom_generateCustomTheme(
    customColors: <MyCustomColor>[
      MyCustomColor(
        name: 'My name 1',
        harmonized: true,
        color: '#5f5519',
      ),
      MyCustomColor(
        name: 'My name 2',
        harmonized: false,
        color: '#5f5519',
      ),
    ],
    coreColors: coreColors,
  );

  return Themes(
    ThemeData.from(
      useMaterial3: true,
      colorScheme: themes.lightScheme.toColorScheme(),
    ),
    ThemeData.from(
      useMaterial3: true,
      colorScheme: themes.darkScheme.toColorScheme(),
    ),
  );

}

