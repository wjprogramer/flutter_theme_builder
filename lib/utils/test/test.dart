import 'dart:ui';

import 'package:flutter_theme_builder/app/asset_path.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/core/image.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
import 'package:material_color_utilities/hct/hct_solver.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

Future<void> testSomething() async {
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
  final customTheme = custom_generateCustomTheme(
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
  // print(getPrettyJSONString(customTheme.toJson()));

  ThemeTempUtility.baseline_getScheme(Brightness.light).toColorScheme();

}

