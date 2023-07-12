import 'dart:ui';

import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

extension _BigIntX on BigInt {
  // BigInt operator >>>(BigInt other) {
  //   return this;
  // }
}

extension TonalPaletteX on colorUtilities.TonalPalette {
  Map xToJson() {
    var tonalRange = [100, 99, 98, 95, 90, 80, 70, 60, 50, 40, 35, 30, 25, 20, 15, 10, 5, 0];
    final result = {};
    for (final range in tonalRange) {
      final value = this.get(range);
      result[range.toString()] = hexFromArgb(value);
    }
    return result;
  }
}

extension CorePalette on colorUtilities.CorePalette {
  MyCorePalette toMyCorePalette() {
    return MyCorePalette(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
      neutral: neutral,
      neutralVariant: neutralVariant,
      error: error,
    );
  }
}

extension SchemeX on colorUtilities.Scheme {
  MyScheme toMyScheme(Brightness brightness) => MyScheme(
    brightness: brightness,
    primary: MyToken(value: primary),
    onPrimary: MyToken(value: onPrimary),
    primaryContainer: MyToken(value: primaryContainer),
    onPrimaryContainer: MyToken(value: onPrimaryContainer),
    secondary: MyToken(value: secondary),
    onSecondary: MyToken(value: onSecondary),
    secondaryContainer: MyToken(value: secondaryContainer),
    onSecondaryContainer: MyToken(value: onSecondaryContainer),
    tertiary: MyToken(value: tertiary),
    onTertiary: MyToken(value: onTertiary),
    tertiaryContainer: MyToken(value: tertiaryContainer),
    onTertiaryContainer: MyToken(value: onTertiaryContainer),
    error: MyToken(value: error),
    onError: MyToken(value: onError),
    errorContainer: MyToken(value: errorContainer),
    onErrorContainer: MyToken(value: onErrorContainer),
    outline: MyToken(value: outline),
    background: MyToken(value: background),
    onBackground: MyToken(value: onBackground),
    surface: MyToken(value: surface),
    onSurface: MyToken(value: onSurface),
    surfaceVariant: MyToken(value: surfaceVariant),
    onSurfaceVariant: MyToken(value: onSurfaceVariant),
    inverseSurface: MyToken(value: inverseSurface),
    inverseOnSurface: MyToken(value: inverseOnSurface),
    inversePrimary: MyToken(value: inversePrimary),
    shadow: MyToken(value: shadow),
    surfaceTint: null,
    outlineVariant: MyToken(value: outlineVariant),
    scrim: MyToken(value: scrim),
  );
}
