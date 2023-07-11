import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_theme_builder/extensions/extensions.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/material/cam16.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:flutter_theme_builder/utils/material/color_hct.dart';
import 'package:flutter_theme_builder/utils/math/math.dart';
import 'package:flutter_theme_builder/utils/core/others.dart';
import 'package:material_color_utilities/hct/hct_solver.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

void testSomething() {
  const argb = 4284437785;

  // CAM 16
  final cam16X = Cam16_fromIntInViewingConditions(argb);
  assert(cam16X.hue == 101.17838538883424);
  assert(cam16X.chroma == 30.09871415844342);
  assert(cam16X.j == 26.796364190204315);
  assert(cam16X.q == 80.50586642729215);
  assert(cam16X.m == 0.0); // TODO: JS 版本沒有這個值
  assert(cam16X.s == 54.3289727374645);
  assert(cam16X.jstar == 38.35870274332909);
  assert(cam16X.astar == -3.6812065087014454);
  assert(cam16X.bstar == 18.62833142800411);

  // HCT
  final hct = colorUtilities.Hct.fromInt(argb);
  assert(hct.chroma == 30.09871415844342);
  assert(hct.hue == 101.17838538883424);
  assert(hct.tone == 35.98445374732086);

  // HCT / HctSolver.solveToInt
  assert(HctSolver.solveToInt(25, 84, 20) == 4285071365);
  assert(HctSolver.solveToInt(101.17838538883424, 8, 0) == 4278190080);

  // Tonal Palette
  final tonalPalette = colorUtilities.TonalPalette.of(25, 84);

  final tonesGroup = tonal_group_tonesToTonalGroup(tonalPalette);
  myAssertEqual(tonesGroup[0], "#000000");
  myAssertEqual(tonesGroup[10], "#410002");
  myAssertEqual(tonesGroup[20], "#690005");
  myAssertEqual(tonesGroup[25], "#7e0007");
  myAssertEqual(tonesGroup[30], "#93000a");
  myAssertEqual(tonesGroup[35], "#a80710");
  myAssertEqual(tonesGroup[40], "#ba1a1a");
  myAssertEqual(tonesGroup[50], "#de3730");
  myAssertEqual(tonesGroup[60], "#ff5449");
  myAssertEqual(tonesGroup[70], "#ff897d");
  myAssertEqual(tonesGroup[80], "#ffb4ab");
  myAssertEqual(tonesGroup[90], "#ffdad6");
  myAssertEqual(tonesGroup[95], "#ffedea");
  myAssertEqual(tonesGroup[98], "#fff8f7");
  myAssertEqual(tonesGroup[99], "#fffbff");
  myAssertEqual(tonesGroup[100], "#ffffff");

  // Core Palette
  // 前面註解為 js 版本的名稱
  final corePalette = colorUtilities.CorePalette.of(argb);
  /* a1    */ myAssertEqual(corePalette.primary.toString(),         'TonalPalette.of(101.17838538883424, 48.0)');
  /* a2    */ myAssertEqual(corePalette.secondary.toString(),       'TonalPalette.of(101.17838538883424, 16.0)');
  /* a3    */ myAssertEqual(corePalette.tertiary.toString(),        'TonalPalette.of(161.17838538883424, 24.0)');
  /* n1    */ myAssertEqual(corePalette.neutral.toString(),         'TonalPalette.of(101.17838538883424, 4.0)');
  /* n2    */ myAssertEqual(corePalette.neutralVariant.toString(),  'TonalPalette.of(101.17838538883424, 8.0)');
  /* error */ myAssertEqual(corePalette.error.toString(),           'TonalPalette.of(25.0, 84.0)');

  final corePaletteContent = colorUtilities.CorePalette.contentOf(argb);
  /* a1    */ myAssertEqual(corePaletteContent.primary.toString(),         'TonalPalette.of(101.17838538883424, 30.09871415844342)');
  /* a2    */ myAssertEqual(corePaletteContent.secondary.toString(),       'TonalPalette.of(101.17838538883424, 10.03290471948114)');
  /* a3    */ myAssertEqual(corePaletteContent.tertiary.toString(),        'TonalPalette.of(161.17838538883424, 15.04935707922171)');
  /* n1    */ myAssertEqual(corePaletteContent.neutral.toString(),         'TonalPalette.of(101.17838538883424, 2.508226179870285)');
  /* n2    */ myAssertEqual(corePaletteContent.neutralVariant.toString(),  'TonalPalette.of(101.17838538883424, 5.01645235974057)');
  /* error */ myAssertEqual(corePaletteContent.error.toString(),           'TonalPalette.of(25.0, 84.0)');

  // Scheme
  colorUtilities.Scheme.lightFromCorePalette(corePalette);

  // Color utils
  myAssertEqual(argbFromHex('#9d906d'), 4288516205);

  // Custom schemes
  final customTheme = custom_generateCustomTheme({},
    coreColors: {
      'primary': '#006b62',
      'secondary': '#9d906d',
      'tertiary': '#a288ab',
      'neutral': '#938f94',
    },
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
  );
  print(getPrettyJSONString(customTheme.toJson()));

  ThemeTempUtility.baseline_getScheme(Brightness.light).toColorScheme();

}


dynamic color_replaceArgbWithHex(key, value) {
  return value is num
      ? hexFromArgb(value.toInt())
      : value;
}

custom_color_convertCustomColors(List<MyCustomColor> colors, String sourceColor) {
  final res = colors.map((color$jscomp$0) {
    final sourceValue = argbFromHex(sourceColor);
    var JSCompiler_inline_result = {
      'name': color$jscomp$0.name,
      'value': argbFromHex(color$jscomp$0.color),
      'blend': color$jscomp$0.harmonized
    };
    var value = JSCompiler_inline_result['value'];
    final from = value;
    if (JSCompiler_inline_result['blend']) {
      final fromHct = colorUtilities.Hct.fromInt(from),
          toHct = colorUtilities.Hct.fromInt(sourceValue);
      value = (colorUtilities.Hct.fromInt(HctSolver.solveToInt(math_utils_sanitizeDegreesDouble(fromHct.hue +
          math.min(.5 * (180 - ((fromHct.hue - toHct.hue).abs() - 180).abs()), 15) * (180 >= math_utils_sanitizeDegreesDouble(toHct.hue - fromHct.hue) ? 1 : -1)), fromHct.chroma, fromHct.tone))).toInt();
    }
    final tones = colorUtilities.CorePalette.of(value).primary;
    var JSCompiler_inline_result$jscomp$0 = {
      'color': JSCompiler_inline_result,
      'value': value,
      'light': {
        'color': tones.get(40),
        'onColor': tones.get(100),
        'colorContainer': tones.get(90),
        'onColorContainer': tones.get(10)
      },
      'dark': {
        'color': tones.get(80),
        'onColor': tones.get(20),
        'colorContainer': tones.get(30),
        'onColorContainer': tones.get(90)
      }
    };
    final color = JSCompiler_inline_result$jscomp$0['color'],
        data = myJsonConverter(JSCompiler_inline_result$jscomp$0, toEncodable: color_replaceArgbWithHex);

    var JSCompiler_inline_result$jscomp$1 = Map.from(data);
    JSCompiler_inline_result$jscomp$1['color'] = {
      'name': color['name'],
      'harmonized': color['blend'],
      'color': hexFromArgb(color['value']),
    };

    final palette = colorUtilities.CorePalette.of(argbFromHex(JSCompiler_inline_result$jscomp$1['value']));

    final rrr = Map.from(JSCompiler_inline_result$jscomp$1);
    rrr['palettes'] = palette.toMyCorePalette();
    return rrr;
  }).toList();

  return res;
}

Map<int, String> tonal_group_tonesToTonalGroup(colorUtilities.TonalPalette tonalPalette) {
  return {
    100: hexFromArgb(tonalPalette.get(100)),
    99: hexFromArgb(tonalPalette.get(99)),
    98: hexFromArgb(tonalPalette.get(98)),
    95: hexFromArgb(tonalPalette.get(95)),
    90: hexFromArgb(tonalPalette.get(90)),
    80: hexFromArgb(tonalPalette.get(80)),
    70: hexFromArgb(tonalPalette.get(70)),
    60: hexFromArgb(tonalPalette.get(60)),
    50: hexFromArgb(tonalPalette.get(50)),
    40: hexFromArgb(tonalPalette.get(40)),
    35: hexFromArgb(tonalPalette.get(35)),
    30: hexFromArgb(tonalPalette.get(30)),
    25: hexFromArgb(tonalPalette.get(25)),
    20: hexFromArgb(tonalPalette.get(20)),
    10: hexFromArgb(tonalPalette.get(10)),
    0: hexFromArgb(tonalPalette.get(0)),
  };
}

tonal_group_convertTonalGroupToMap(prefix, colorUtilities.TonalPalette group) {
  final map = {};

  map['${prefix}-100'] = group.get(100);
  map['${prefix}-99'] = group.get(99);
  map['${prefix}-98'] = group.get(98);
  map['${prefix}-95'] = group.get(95);
  map['${prefix}-90'] = group.get(90);
  map['${prefix}-80'] = group.get(80);
  map['${prefix}-70'] = group.get(70);
  map['${prefix}-60'] = group.get(60);
  map['${prefix}-50'] = group.get(50);
  map['${prefix}-40'] = group.get(40);
  map['${prefix}-35'] = group.get(35);
  map['${prefix}-30'] = group.get(30);
  map['${prefix}-25'] = group.get(25);
  map['${prefix}-20'] = group.get(20);
  map['${prefix}-10'] = group.get(10);
  map['${prefix}-0'] = group.get(0);

  return map;
}

MyDemoThemeData custom_generateCustomTheme(options, {
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
      },
      p = {};

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







String getPrettyJSONString(jsonObject){
  var encoder = JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}


