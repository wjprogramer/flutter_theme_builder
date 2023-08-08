import 'package:flutter/material.dart';

class Themes {
  Themes(ThemeData light, ThemeData dark)
      : this.light = _wrapTheme(light),
        this.dark = _wrapTheme(dark);

  static ThemeData _wrapTheme(ThemeData theme) {
    final newTheme = theme.copyWith(
      cardTheme: CardTheme(
        elevation: 0,
        color: theme.colorScheme.tertiaryContainer,
      ),
    );

    return newTheme;
  }

  final ThemeData light;
  final ThemeData dark;
}

class TempThemeValues {
  TempThemeValues._();

  static const fontSize88 = 88.0;

  static const lineHeight11 = 1.1;
}

