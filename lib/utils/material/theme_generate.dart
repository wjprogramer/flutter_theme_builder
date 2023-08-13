import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:flutter_theme_builder/utils/material/palette.dart';
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

    // region TODO: ...
    final newRR = MyCustomColorResult(
      name: myCustomColor.name,
      color: myCustomColor.color,
      harmonized: myCustomColor.harmonized,
      light: lightColorScheme,
      dark: darkColorScheme,
      palette: palette,
    );
    // endregion

    return newRR;
  }).toList();

  return res;
}

MyDemoThemeData custom_generateCustomTheme({
  List<MyCustomColor> customColors = const [],
  required Map<String, String?> coreColors,
  bool isContent = false,
}) {
  final baseline = ThemeTempUtility.baseline_generateBaseline(
    customColors: customColors,
  );
  final sourceColor = coreColors['primary'] ?? baseline.coreColors['primary']!;
  final source = argbFromHex(sourceColor),
      cp = isContent
          ? colorUtilities.CorePalette.contentOf(source)
          : colorUtilities.CorePalette.of(source);
  var palettes = MyCorePalette(
    primary: cp.primary,
    secondary: cp.secondary,
    tertiary: cp.tertiary,
    neutral: cp.neutral,
    neutralVariant: cp.neutralVariant,
    error: cp.error,
  );

  final paletteKeys = {
    'primary': "P",
    'secondary': "S",
    'tertiary': "T",
    'neutral': "N",
    'neutralVariant': "NV",
    'error': "E"
  }, p = {};

  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['primary'], palettes.primary)));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['secondary'], palettes.secondary)));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['tertiary'], palettes.tertiary)));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['neutral'], palettes.neutral)));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['neutralVariant'], palettes.neutralVariant)));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['error'], palettes.error)));

  for (final entry in coreColors.entries) {
    final key = entry.key,
        value = entry.value;

    if (value == null) {
      continue;
    }

    final coreColorPalette = colorUtilities.CorePalette.of(argbFromHex(value)),
        customPalettes = palettes,
        toneGroup = coreColorPalette.primary;
    customPalettes.setByKey(key, toneGroup);
    palettes = customPalettes;

    final Map map = tonal_group_convertTonalGroupToMap(paletteKeys[key], toneGroup);
    for (final mapEntry in map.entries) {
      p[mapEntry.key] = mapEntry.value;
    }
  }
  var JSCompiler_temp_const$jscomp$1 = custom_color_convertCustomColors(customColors, sourceColor);

  final lightScheme = MyScheme(
    brightness:           Brightness.light,
    primary:              MyToken(value: p["P-40"]),
    onPrimary:            MyToken(value: p["P-100"]),
    primaryContainer:     MyToken(value: p["P-90"]),
    onPrimaryContainer:   MyToken(value: p["P-10"]),
    secondary:            MyToken(value: p["S-40"]),
    onSecondary:          MyToken(value: p["S-100"]),
    secondaryContainer:   MyToken(value: p["S-90"]),
    onSecondaryContainer: MyToken(value: p["S-10"]),
    tertiary:             MyToken(value: p["T-40"]),
    onTertiary:           MyToken(value: p["T-100"]),
    tertiaryContainer:    MyToken(value: p["T-90"]),
    onTertiaryContainer:  MyToken(value: p["T-10"]),
    error:                MyToken(value: p["E-40"]),
    errorContainer:       MyToken(value: p["E-90"]),
    onError:              MyToken(value: p["E-100"]),
    onErrorContainer:     MyToken(value: p["E-10"]),
    background:           MyToken(value: p["N-99"]),
    onBackground:         MyToken(value: p["N-10"]),
    surface:              MyToken(value: p["N-99"]),
    onSurface:            MyToken(value: p["N-10"]),
    surfaceVariant:       MyToken(value: p["NV-90"]),
    onSurfaceVariant:     MyToken(value: p["NV-30"]),
    outline:              MyToken(value: p["NV-50"]),
    inverseOnSurface:     MyToken(value: p["N-95"]),
    inverseSurface:       MyToken(value: p["N-20"]),
    inversePrimary:       MyToken(value: p["P-80"]),
    shadow:               MyToken(value: p["N-0"]),
    surfaceTint:          MyToken(value: p["P-40"]),
    outlineVariant:       MyToken(value: p["NV-80"]),
    scrim:                MyToken(value: p["N-0"]),
  );

  final darkScheme = MyScheme(
    brightness:           Brightness.dark,
    primary:              MyToken(value: p["P-80"]),
    onPrimary:            MyToken(value: p["P-20"]),
    primaryContainer:     MyToken(value: p["P-30"]),
    onPrimaryContainer:   MyToken(value: p["P-90"]),
    secondary:            MyToken(value: p["S-80"]),
    onSecondary:          MyToken(value: p["S-20"]),
    secondaryContainer:   MyToken(value: p["S-30"]),
    onSecondaryContainer: MyToken(value: p["S-90"]),
    tertiary:             MyToken(value: p["T-80"]),
    onTertiary:           MyToken(value: p["T-20"]),
    tertiaryContainer:    MyToken(value: p["T-30"]),
    onTertiaryContainer:  MyToken(value: p["T-90"]),
    error:                MyToken(value: p["E-80"]),
    errorContainer:       MyToken(value: p["E-30"]),
    onError:              MyToken(value: p["E-20"]),
    onErrorContainer:     MyToken(value: p["E-90"]),
    background:           MyToken(value: p["N-10"]),
    onBackground:         MyToken(value: p["N-90"]),
    surface:              MyToken(value: p["N-10"]),
    onSurface:            MyToken(value: p["N-90"]),
    surfaceVariant:       MyToken(value: p["NV-30"]),
    onSurfaceVariant:     MyToken(value: p["NV-80"]),
    outline:              MyToken(value: p["NV-60"]),
    inverseOnSurface:     MyToken(value: p["N-10"]),
    inverseSurface:       MyToken(value: p["N-90"]),
    inversePrimary:       MyToken(value: p["P-40"]),
    shadow:               MyToken(value: p["N-0"]),
    surfaceTint:          MyToken(value: p["P-80"]),
    outlineVariant:       MyToken(value: p["NV-30"]),
    scrim:                MyToken(value: p["N-0"]),
  );

  final androidLightScheme = {
    'colorAccentPrimary': p["P-90"] ?? hexFromArgb(cp.primary.get(90)),
    'colorAccentPrimaryVariant': p["P-40"] ?? hexFromArgb(cp.primary.get(40)),
    'colorAccentSecondary': p["S-90"] ?? hexFromArgb(cp.secondary.get(90)),
    'colorAccentSecondaryVariant': p["S-40"] ?? hexFromArgb(cp.secondary.get(40)),
    'colorAccentTertiary': p["T-90"] ?? hexFromArgb(cp.tertiary.get(90)),
    'colorAccentTertiaryVariant': p["T-40"] ?? hexFromArgb(cp.tertiary.get(40)),
    'textColorPrimary': p["N-10"] ?? hexFromArgb(cp.neutral.get(10)),
    'textColorSecondary': p["NV-30"] ?? hexFromArgb(cp.neutralVariant.get(30)),
    'textColorTertiary': p["NV-50"] ?? hexFromArgb(cp.neutralVariant.get(50)),
    'textColorPrimaryInverse': p["N-95"] ?? hexFromArgb(cp.neutral.get(95)),
    'textColorSecondaryInverse': p["N-80"] ?? hexFromArgb(cp.neutral.get(80)),
    'textColorTertiaryInverse': p["N-60"] ?? hexFromArgb(cp.neutral.get(60)),
    'colorBackground': p["N-95"] ?? hexFromArgb(cp.neutral.get(95)),
    'colorBackgroundFloating': p["N-98"] ?? hexFromArgb(cp.neutral.get(98)),
    'colorSurface': p["N-98"] ?? hexFromArgb(cp.neutral.get(98)),
    'colorSurfaceVariant': p["N-90"] ?? hexFromArgb(cp.neutral.get(90)),
    'colorSurfaceHighlight': p["N-100"] ?? hexFromArgb(cp.neutral.get(100)),
    'surfaceHeader': p["N-90"] ?? hexFromArgb(cp.neutral.get(90)),
    'underSurface': p["N-0"] ?? hexFromArgb(cp.neutral.get(0)),
    'offState': p["N-20"] ?? hexFromArgb(cp.neutral.get(20)),
    'accentSurface': p["NV-95"] ?? hexFromArgb(cp.secondary.get(95)),
    'textPrimaryOnAccent': p["N-10"] ?? hexFromArgb(cp.neutral.get(10)),
    'textSecondaryOnAccent': p["NV-30"] ?? hexFromArgb(cp.neutralVariant.get(30)),
    'volumeBackground': p["N-25"] ?? hexFromArgb(cp.neutral.get(25)),
    'scrim': p["N-80"] ?? hexFromArgb(cp.neutral.get(80)),
  };
  final androidDarkScheme = {
    'colorAccentPrimary': p["P-90"] ?? hexFromArgb(cp.primary.get(90)),
    'colorAccentPrimaryVariant': p["P-70"] ?? hexFromArgb(cp.primary.get(70)),
    'colorAccentSecondary': p["S-90"] ?? hexFromArgb(cp.secondary.get(90)),
    'colorAccentSecondaryVariant': p["S-70"] ?? hexFromArgb(cp.secondary.get(70)),
    'colorAccentTertiary': p["T-90"] ?? hexFromArgb(cp.tertiary.get(90)),
    'colorAccentTertiaryVariant': p["T-70"] ?? hexFromArgb(cp.tertiary.get(70)),
    'textColorPrimary': p["N-95"] ?? hexFromArgb(cp.neutral.get(95)),
    'textColorSecondary': p["NV-80"] ?? hexFromArgb(cp.neutralVariant.get(80)),
    'textColorTertiary': p["NV-60"] ?? hexFromArgb(cp.neutralVariant.get(60)),
    'textColorPrimaryInverse': p["N-10"] ?? hexFromArgb(cp.neutral.get(10)),
    'textColorSecondaryInverse': p["N-30"] ?? hexFromArgb(cp.neutral.get(30)),
    'textColorTertiaryInverse': p["N-50"] ?? hexFromArgb(cp.neutral.get(50)),
    'colorBackground': p["N-10"] ?? hexFromArgb(cp.neutral.get(10)),
    'colorBackgroundFloating': p["N-10"] ?? hexFromArgb(cp.neutral.get(10)),
    'colorSurface': p["N-20"] ?? hexFromArgb(cp.neutral.get(20)),
    'colorSurfaceVariant': p["N-30"] ?? hexFromArgb(cp.neutral.get(30)),
    'colorSurfaceHighlight': p["N-35"] ?? hexFromArgb(cp.neutral.get(35)),
    'surfaceHeader': p["N-30"] ?? hexFromArgb(cp.neutral.get(30)),
    'underSurface': p["N-0"] ?? hexFromArgb(cp.neutral.get(0)),
    'offState': p["N-20"] ?? hexFromArgb(cp.neutral.get(20)),
    'accentSurface': p["NV-95"] ?? hexFromArgb(cp.secondary.get(95)),
    'textPrimaryOnAccent': p["N-10"] ?? hexFromArgb(cp.neutral.get(10)),
    'textSecondaryOnAccent': p["NV-30"] ?? hexFromArgb(cp.neutralVariant.get(30)),
    'volumeBackground': p["N-25"] ?? hexFromArgb(cp.neutral.get(25)),
    'scrim': p["N-80"] ?? hexFromArgb(cp.neutral.get(80)),
  };

  return baseline.copyWith(
    baseline: false,
    seed: sourceColor,
    extendedColors: customColors,
    customColors: JSCompiler_temp_const$jscomp$1,
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