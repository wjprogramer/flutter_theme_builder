import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_theme_builder/enums/enums.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:flutter_theme_builder/utils/math/math.dart';
import 'package:material_color_utilities/hct/hct_solver.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

List<MyCustomColorResult> custom_color_convertCustomColors(List<MyCustomColor> colors, String sourceColor) {
  final res = colors.map((myCustomColor) {
    final sourceValue = argbFromHex(sourceColor);
    final blend = myCustomColor.harmonized;
    int value = argbFromHex(myCustomColor.color);

    final from = value;
    if (blend) {
      final fromHct = colorUtilities.Hct.fromInt(from),
          toHct = colorUtilities.Hct.fromInt(sourceValue);
      value = colorUtilities.Hct.fromInt(
          HctSolver.solveToInt(
            math_utils_sanitizeDegreesDouble(
                fromHct.hue +
                    math.min(.5 * (180 - ((fromHct.hue - toHct.hue).abs() - 180).abs()), 15) *
                        (180 >= math_utils_sanitizeDegreesDouble(toHct.hue - fromHct.hue) ? 1 : -1)
            ),
            fromHct.chroma,
            fromHct.tone,
          )
      ).toInt();
    }
    final tones = colorUtilities.CorePalette.of(value).primary;

    final lightColorScheme = MySingleColorScheme(
      color: tones.get(40),
      onColor: tones.get(100),
      colorContainer: tones.get(90),
      onColorContainer: tones.get(10),
    );
    final darkColorScheme = MySingleColorScheme(
      color: tones.get(80),
      onColor: tones.get(20),
      colorContainer: tones.get(30),
      onColorContainer: tones.get(90),
    );

    final palette = colorUtilities.CorePalette.of(
      argbFromHex(toHexFromHexOrArgb(value)),
    ).primary;

    return MyCustomColorResult(
      name: myCustomColor.name,
      color: myCustomColor.color,
      harmonized: myCustomColor.harmonized,
      light: lightColorScheme,
      dark: darkColorScheme,
      palette: palette,
    );
  }).toList();

  return res;
}

MyDemoThemeData custom_generateCustomTheme({
  List<MyCustomColor> customColors = const [],
  bool isContent = false,
  required String? primary,
  required String? secondary,
  required String? tertiary,
  required String? neutral,

}) {
  final baseline = ThemeTempUtility.baseline_generateBaseline(
    customColors: customColors,
  );
  final sourceColor = primary ?? baseline.coreColors['primary']!;
  final source = argbFromHex(sourceColor);

  final corePalette = isContent
      ? colorUtilities.CorePalette.contentOf(source)
      : colorUtilities.CorePalette.of(source);

  var palettes = MyCorePalette(
    primary: corePalette.primary,
    secondary: corePalette.secondary,
    tertiary: corePalette.tertiary,
    neutral: corePalette.neutral,
    neutralVariant: corePalette.neutralVariant,
    error: corePalette.error,
  );

  final coreColors = <MyColorSchemeKey, String?>{
    MyColorSchemeKey.primary: primary,
    MyColorSchemeKey.secondary: secondary,
    MyColorSchemeKey.tertiary: tertiary,
    MyColorSchemeKey.neutral: neutral,
  };

  for (final entry in coreColors.entries) {
    final key = entry.key,
        value = entry.value;

    if (value == null) {
      continue;
    }


    final coreColorPalette = colorUtilities.CorePalette.of(
      argbFromHex(value),
    ),
        customPalettes = palettes;
    customPalettes.setByKey(key, coreColorPalette.primary);
    palettes = customPalettes;
  }

  final lightScheme = MyScheme(
    brightness:           Brightness.light,
    primary:              MyToken(value: palettes.primary.get(40)),
    onPrimary:            MyToken(value: palettes.primary.get(100)),
    primaryContainer:     MyToken(value: palettes.primary.get(90)),
    onPrimaryContainer:   MyToken(value: palettes.primary.get(10)),
    secondary:            MyToken(value: palettes.secondary.get(40)),
    onSecondary:          MyToken(value: palettes.secondary.get(100)),
    secondaryContainer:   MyToken(value: palettes.secondary.get(90)),
    onSecondaryContainer: MyToken(value: palettes.secondary.get(10)),
    tertiary:             MyToken(value: palettes.tertiary.get(40)),
    onTertiary:           MyToken(value: palettes.tertiary.get(100)),
    tertiaryContainer:    MyToken(value: palettes.tertiary.get(90)),
    onTertiaryContainer:  MyToken(value: palettes.tertiary.get(10)),
    error:                MyToken(value: palettes.error.get(40)),
    errorContainer:       MyToken(value: palettes.error.get(90)),
    onError:              MyToken(value: palettes.error.get(100)),
    onErrorContainer:     MyToken(value: palettes.error.get(10)),
    background:           MyToken(value: palettes.neutral.get(99)),
    onBackground:         MyToken(value: palettes.neutral.get(10)),
    surface:              MyToken(value: palettes.neutral.get(99)),
    onSurface:            MyToken(value: palettes.neutral.get(10)),
    surfaceVariant:       MyToken(value: palettes.neutralVariant.get(90)),
    onSurfaceVariant:     MyToken(value: palettes.neutralVariant.get(30)),
    outline:              MyToken(value: palettes.neutralVariant.get(50)),
    inverseOnSurface:     MyToken(value: palettes.neutral.get(95)),
    inverseSurface:       MyToken(value: palettes.neutral.get(20)),
    inversePrimary:       MyToken(value: palettes.primary.get(80)),
    shadow:               MyToken(value: palettes.neutral.get(0)),
    surfaceTint:          MyToken(value: palettes.primary.get(40)),
    outlineVariant:       MyToken(value: palettes.neutralVariant.get(80)),
    scrim:                MyToken(value: palettes.neutral.get(0)),
  );

  final darkScheme = MyScheme(
    brightness:           Brightness.dark,
    primary:              MyToken(value: palettes.primary.get(80)),
    onPrimary:            MyToken(value: palettes.primary.get(20)),
    primaryContainer:     MyToken(value: palettes.primary.get(30)),
    onPrimaryContainer:   MyToken(value: palettes.primary.get(90)),
    secondary:            MyToken(value: palettes.secondary.get(80)),
    onSecondary:          MyToken(value: palettes.secondary.get(20)),
    secondaryContainer:   MyToken(value: palettes.secondary.get(30)),
    onSecondaryContainer: MyToken(value: palettes.secondary.get(90)),
    tertiary:             MyToken(value: palettes.tertiary.get(80)),
    onTertiary:           MyToken(value: palettes.tertiary.get(20)),
    tertiaryContainer:    MyToken(value: palettes.tertiary.get(30)),
    onTertiaryContainer:  MyToken(value: palettes.tertiary.get(90)),
    error:                MyToken(value: palettes.error.get(80)),
    errorContainer:       MyToken(value: palettes.error.get(30)),
    onError:              MyToken(value: palettes.error.get(20)),
    onErrorContainer:     MyToken(value: palettes.error.get(90)),
    background:           MyToken(value: palettes.neutral.get(10)),
    onBackground:         MyToken(value: palettes.neutral.get(90)),
    surface:              MyToken(value: palettes.neutral.get(10)),
    onSurface:            MyToken(value: palettes.neutral.get(90)),
    surfaceVariant:       MyToken(value: palettes.neutralVariant.get(30)),
    onSurfaceVariant:     MyToken(value: palettes.neutralVariant.get(80)),
    outline:              MyToken(value: palettes.neutralVariant.get(60)),
    inverseOnSurface:     MyToken(value: palettes.neutral.get(10)),
    inverseSurface:       MyToken(value: palettes.neutral.get(90)),
    inversePrimary:       MyToken(value: palettes.primary.get(40)),
    shadow:               MyToken(value: palettes.neutral.get(0)),
    surfaceTint:          MyToken(value: palettes.primary.get(80)),
    outlineVariant:       MyToken(value: palettes.neutralVariant.get(30)),
    scrim:                MyToken(value: palettes.neutral.get(0)),
  );

  final androidLightScheme = {
    'colorAccentPrimary': palettes.primary.get(90),
    'colorAccentPrimaryVariant': palettes.primary.get(40),
    'colorAccentSecondary': palettes.secondary.get(90),
    'colorAccentSecondaryVariant': palettes.secondary.get(40),
    'colorAccentTertiary': palettes.tertiary.get(90),
    'colorAccentTertiaryVariant': palettes.tertiary.get(40),
    'textColorPrimary': palettes.neutral.get(10),
    'textColorSecondary': palettes.neutralVariant.get(30),
    'textColorTertiary': palettes.neutralVariant.get(50),
    'textColorPrimaryInverse': palettes.neutral.get(95),
    'textColorSecondaryInverse': palettes.neutral.get(80),
    'textColorTertiaryInverse': palettes.neutral.get(60),
    'colorBackground': palettes.neutral.get(95),
    'colorBackgroundFloating': palettes.neutral.get(98),
    'colorSurface': palettes.neutral.get(98),
    'colorSurfaceVariant': palettes.neutral.get(90),
    'colorSurfaceHighlight': palettes.neutral.get(100),
    'surfaceHeader': palettes.neutral.get(90),
    'underSurface': palettes.neutral.get(0),
    'offState': palettes.neutral.get(20),
    'accentSurface': palettes.neutralVariant.get(95),
    'textPrimaryOnAccent': palettes.neutral.get(10),
    'textSecondaryOnAccent': palettes.neutralVariant.get(30),
    'volumeBackground': palettes.neutral.get(25),
    'scrim': palettes.neutral.get(80),
  };
  final androidDarkScheme = {
    'colorAccentPrimary': palettes.primary.get(90),
    'colorAccentPrimaryVariant': palettes.primary.get(70),
    'colorAccentSecondary': palettes.secondary.get(90),
    'colorAccentSecondaryVariant': palettes.secondary.get(70),
    'colorAccentTertiary': palettes.tertiary.get(90),
    'colorAccentTertiaryVariant': palettes.tertiary.get(70),
    'textColorPrimary': palettes.neutral.get(95),
    'textColorSecondary': palettes.neutralVariant.get(80),
    'textColorTertiary': palettes.neutralVariant.get(60),
    'textColorPrimaryInverse': palettes.neutral.get(10),
    'textColorSecondaryInverse': palettes.neutral.get(30),
    'textColorTertiaryInverse': palettes.neutral.get(50),
    'colorBackground': palettes.neutral.get(10),
    'colorBackgroundFloating': palettes.neutral.get(10),
    'colorSurface': palettes.neutral.get(20),
    'colorSurfaceVariant': palettes.neutral.get(30),
    'colorSurfaceHighlight': palettes.neutral.get(35),
    'surfaceHeader': palettes.neutral.get(30),
    'underSurface': palettes.neutral.get(0),
    'offState': palettes.neutral.get(20),
    'accentSurface': palettes.neutralVariant.get(95),
    'textPrimaryOnAccent': palettes.neutral.get(10),
    'textSecondaryOnAccent': palettes.neutralVariant.get(30),
    'volumeBackground': palettes.neutral.get(25),
    'scrim': palettes.neutral.get(80),
  };

  return baseline.copyWith(
    baseline: false,
    seed: sourceColor,
    extendedColors: customColors,
    customColors: custom_color_convertCustomColors(customColors, sourceColor),
    lightScheme: lightScheme,
    darkScheme: darkScheme,
    androidSchemes: {
      'androidLight': androidLightScheme,
      'androidDark': androidDarkScheme,
    },
    palettes: palettes,
    coreColors: coreColors,
  );
}