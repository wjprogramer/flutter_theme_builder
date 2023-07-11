import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/utils/test/test.dart';

Themes demoData1() {
  final themes = custom_generateCustomTheme({},
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
    coreColors: {
      'primary': '#006b62',
      'secondary': '#9d906d',
      'tertiary': '#a288ab',
      'neutral': '#938f94',
    },
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

