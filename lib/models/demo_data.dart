import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/test.dart';

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
      )
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
      colorScheme: themes.schemes['light']!.toColorScheme(),
    ),
    ThemeData.from(
      useMaterial3: true,
      colorScheme: themes.schemes['dark']!.toColorScheme(),
    ),
  );

}

