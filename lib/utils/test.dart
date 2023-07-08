import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/other_utils.dart';
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
  final a = custom_generateCustomTheme({
    'coreColors': {
      'primary': '#006b62',
      'secondary': '#9d906d',
      'tertiary': '#a288ab',
      'neutral': '#938f94',
    },
    'is3p': false,
    'customColors': <MyCustomColor>[
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
  });
  print(a);
  print(a);
  print(a);

}

// 415 OK
num math_utils_signum(n) {
  return 0 > n ? -1 : 0 == n ? 0 : 1;
}

// 419
math_utils_sanitizeDegreesInt(degrees) {
  degrees %= 360;
  0 > degrees && (degrees += 360);
  return degrees;
}

// 425
math_utils_sanitizeDegreesDouble(degrees) {
  degrees %= 360;
  0 > degrees && (degrees += 360);
  return degrees;
}

// 435
const utils$color_utils_SRGB_TO_XYZ = [
  [.41233895, .35762064, .18051042],
  [.2126, .7152, .0722],
  [.01932141, .11916382, .95034478]
],
    utils$color_utils_XYZ_TO_SRGB = [
      [3.2413774792388685, -1.5376652402851851, -.49885366846268053],
      [-.9691452513005321, 1.8758853451067872, .04156585616912061],
      [.05562093689691305, -.20395524564742123, 1.0571799111220335]
    ],
    utils$color_utils_WHITE_POINT_D65 = <double>[95.047, 100, 108.883];

// 447
color_utils_argbFromRgb(red, green, blue) {
  return (-16777216 | (red & 255) << 16 | (green & 255) << 8 | blue & 255) >>> 0;
}

// 487 OK
utils$color_utils_labInvf(ft) {
  final ft3 = ft * ft * ft;
  return ft3 > 216 / 24389 ? ft3 : (116 * ft - 16) / (24389 / 27);
}

// OK
num color_utils_linearized(int rgbComponent) {
  final normalized = rgbComponent / 255;
  return .040449936 >= normalized
      ? normalized / 12.92 * 100
      : 100 * math.pow((normalized + .055) / 1.055, 2.4);
}

// 507 OK
final hct$viewing_conditions$ViewingConditions$DEFAULT = (([
  List<double> whitePoint = utils$color_utils_WHITE_POINT_D65,
  _adaptingLuminance,
  double backgroundLstar = 50,
  double surround = 2,
  discountingIlluminant = false,
]) {
  var adaptingLuminance = 200 / math.pi * 100 * utils$color_utils_labInvf(66 / 116) / 100;

  return colorUtilities.ViewingConditions.make(
    whitePoint: whitePoint,
    adaptingLuminance: adaptingLuminance,
    backgroundLstar: backgroundLstar,
    surround: surround,
    discountingIlluminant: discountingIlluminant,
  );
})();

// 552 OK
colorUtilities.Cam16 Cam16_fromIntInViewingConditions(int argb) {
  final redL = color_utils_linearized((argb & 16711680) >> 16);
  final greenL = color_utils_linearized((argb & 65280) >> 8);
  final blueL = color_utils_linearized(argb & 255);
  final x = .41233895 * redL + .35762064 * greenL + .18051042 * blueL,
      y = .2126 * redL + .7152 * greenL + .0722 * blueL,
      z = .01932141 * redL + .11916382 * greenL + .95034478 * blueL,
      rD = hct$viewing_conditions$ViewingConditions$DEFAULT.rgbD[0] * (.401288 * x + .650173 * y - .051461 * z),
      gD = hct$viewing_conditions$ViewingConditions$DEFAULT.rgbD[1] * (-.250268 * x + 1.204414 * y + .045854 * z),
      bD = hct$viewing_conditions$ViewingConditions$DEFAULT.rgbD[2] *
          (-.002079 * x + .048952 * y + .953127 * z),
      rAF = math.pow(hct$viewing_conditions$ViewingConditions$DEFAULT.fl * rD.abs() / 100, .42),
      gAF = math.pow(hct$viewing_conditions$ViewingConditions$DEFAULT.fl * gD.abs() / 100, .42),
      bAF = math.pow(hct$viewing_conditions$ViewingConditions$DEFAULT.fl * bD.abs() / 100,
          .42),
      rA = 400 * math_utils_signum(rD) * rAF / (rAF + 27.13),
      gA = 400 * math_utils_signum(gD) * gAF / (gAF + 27.13),
      bA = 400 * math_utils_signum(bD) * bAF / (bAF + 27.13),
      a = (11 * rA + -12 * gA + bA) / 11,
      b = (rA + gA - 2 * bA) / 9,
      atanDegrees = 180 * math.atan2(b, a) / math.pi,
      hue = 0 > atanDegrees ? atanDegrees + 360 : 360 <= atanDegrees ?
      atanDegrees - 360 : atanDegrees,
      hueRadians = hue * math.pi / 180,
      j = 100.0 * math.pow((40 * rA + 20 * gA + bA) / 20 * hct$viewing_conditions$ViewingConditions$DEFAULT.nbb / hct$viewing_conditions$ViewingConditions$DEFAULT.aw, hct$viewing_conditions$ViewingConditions$DEFAULT.c * hct$viewing_conditions$ViewingConditions$DEFAULT.z),
      alpha = math.pow(5E4 / 13.0 * .25 * (math.cos((20.14 > hue ? hue + 360 : hue) * math.pi / 180 + 2) + 3.8) * hct$viewing_conditions$ViewingConditions$DEFAULT.nC * hct$viewing_conditions$ViewingConditions$DEFAULT.ncb * math.sqrt(a * a + b * b) / ((20 * rA + 20 * gA + 21 * bA) / 20 + .305), .9) * math.pow(1.64 - math.pow(.29, hct$viewing_conditions$ViewingConditions$DEFAULT.backgroundYTowhitePointY),
          .73),
      c = alpha * math.sqrt(j / 100),
      mstar = 1 / .0228 * math.log(1 + .0228 * c * hct$viewing_conditions$ViewingConditions$DEFAULT.fLRoot);

  print('$x, $y, $z');

  return colorUtilities.Cam16(
    /* hue    */ hue,
    /* chroma */ c,
    /* j      */ j.toDouble(),
    /* q      */ 4 / hct$viewing_conditions$ViewingConditions$DEFAULT.c * math.sqrt(j / 100) * (hct$viewing_conditions$ViewingConditions$DEFAULT.aw + 4) * hct$viewing_conditions$ViewingConditions$DEFAULT.fLRoot,
    /* m      */ 0, // FIXME: js 版本沒有這個值
    /* s      */ 50 * math.sqrt(alpha * hct$viewing_conditions$ViewingConditions$DEFAULT.c / (hct$viewing_conditions$ViewingConditions$DEFAULT.aw + 4)),
    /* jstar  */ (1 + 100 * .007) * j / (1 + .007 * j),
    /* astar  */ mstar * math.cos(hueRadians),
    /* bstar  */ mstar * math.sin(hueRadians),
  );
}

// 1640
String hexFromArgb(int argb) {
  final g = argb >> 8 & 255,
      b = argb & 255,
      outParts = [(argb >> 16 & 255).toRadixString(16), g.toRadixString(16), b.toRadixString(16)];

  for (var i = 0; i < outParts.length; i++) {
    final part = outParts[i];
    if (1 == part.length) {
      outParts[i] = "0" + part;
    }
  }
  return "#" + outParts.join("");
}

// 1652
argbFromHex(String h) {
  var hex = h;
  hex = hex.replaceAll("#", "");
  final isThree = 3 == hex.length,
      isSix = 6 == hex.length,
      isEight = 8 == hex.length;
  if (!isThree && !isSix && !isEight) {
    throw Exception("unexpected hex " + hex);
  }
  var r = 0;
  var g = 0;
  var b = 0;

  if (isThree) {
    r = int.parse(hex.substring(0, 1).repeat(2), radix: 16);
    g = int.parse(hex.substring(1, 2).repeat(2), radix: 16);
    b = int.parse(hex.substring(2, 3).repeat(2), radix: 16);
  } else if (isSix) {
    r = int.parse(hex.substring(0, 2), radix: 16);
    g = int.parse(hex.substring(2, 4), radix: 16);
    b = int.parse(hex.substring(4, 6), radix: 16);
  } else if (isEight) {
    r = int.parse(hex.substring(2, 4), radix: 16);
    g = int.parse(hex.substring(4, 6), radix: 16);
    b = int.parse(hex.substring(6, 8), radix: 16);
  }

  return (
      -16777216 |
      (r & 255) << 16 |
      (g & 255) << 8 |
      b & 255
  ).toUnsigned(32); // JS 版本為 `>>> 0`
}

// 1683
dynamic color_replaceArgbWithHex(key, value) {
  return value is num
      ? hexFromArgb(value.toInt())
      : value;
}

// 1698
color_convertTonal(colorUtilities.TonalPalette palette) {
  var tonalRange = [100, 99, 98, 95, 90, 80, 70, 60, 50, 40, 35, 30, 25, 20, 15, 10, 5, 0];
  final result = {};
  for (final range in tonalRange) {
    final value = palette.get(range);
    result[range] = hexFromArgb(value);
  }
  return result;
}

// 1708
color_convertCorePalette(colorUtilities.CorePalette palette) {
  return {
    'primary': color_convertTonal(palette.primary),
    'secondary': color_convertTonal(palette.secondary),
    'tertiary': color_convertTonal(palette.tertiary),
    'neutral': color_convertTonal(palette.neutral),
    'neutralVariant': color_convertTonal(palette.neutralVariant),
    'error': color_convertTonal(palette.error),
  };
}

// 1752
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
    rrr['palettes'] = color_convertCorePalette(palette);
    return rrr;
  }).toList();

  return res;
}

// 2010
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

// 2036
tonal_group_convertTonalGroupToMap(prefix, group) {
  final map = {};

  map['${prefix}-100'] = group[100];
  map['${prefix}-99'] = group[99];
  map['${prefix}-98'] = group[98];
  map['${prefix}-95'] = group[95];
  map['${prefix}-90'] = group[90];
  map['${prefix}-80'] = group[80];
  map['${prefix}-70'] = group[70];
  map['${prefix}-60'] = group[60];
  map['${prefix}-50'] = group[50];
  map['${prefix}-40'] = group[40];
  map['${prefix}-35'] = group[35];
  map['${prefix}-30'] = group[30];
  map['${prefix}-25'] = group[25];
  map['${prefix}-20'] = group[20];
  map['${prefix}-10'] = group[10];
  map['${prefix}-0'] = group[0];

  return map;
}

// 2061
custom_generateCustomTheme(options) {
  var $jscomp$nullish$tmp222;
  final customColors = null != ($jscomp$nullish$tmp222 = null == options
      ? null
      : options['customColors'])
      ? $jscomp$nullish$tmp222
      : [];
  var $jscomp$nullish$tmp223;
  final c = null != ($jscomp$nullish$tmp223 = options['content']) ? $jscomp$nullish$tmp223 : false,
      coreColors = options['coreColors'],
      baseline = ThemeTempUtility.baseline_generateBaseline(
        customColors: options['customColors'],
      );
  final sourceColor = null != coreColors['primary']
      ? coreColors['primary']
      : baseline;
  final source = argbFromHex(sourceColor),
      cp = c ? colorUtilities.CorePalette.contentOf(source) : colorUtilities.CorePalette.of(source);
  var palettes = {
    'primary': tonal_group_tonesToTonalGroup(cp.primary),
    'secondary': tonal_group_tonesToTonalGroup(cp.secondary),
    'tertiary': tonal_group_tonesToTonalGroup(cp.tertiary),
    'neutral': tonal_group_tonesToTonalGroup(cp.neutral),
    'neutralVariant': tonal_group_tonesToTonalGroup(cp.neutralVariant),
    'error': tonal_group_tonesToTonalGroup(cp.error),
  };
  final paletteKeys = {
    'primary': "P",
    'secondary': "S",
    'tertiary': "T",
    'neutral': "N",
    'neutralVariant': "NV",
    'error': "E"
  },
      p = {};

  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['primary'], palettes['primary'])));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['secondary'], palettes['secondary'])));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['tertiary'], palettes['tertiary'])));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['neutral'], palettes['neutral'])));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['neutralVariant'], palettes['neutralVariant'])));
  p.addAll((tonal_group_convertTonalGroupToMap(paletteKeys['error'], palettes['error'])));

  for (final entry in (coreColors as Map).entries) {
    final key = entry.key,
        value = entry.value;

    if (value != null) {
      final coreColorPalette = colorUtilities.CorePalette.of(argbFromHex(value)),
      customPalettes = palettes ?? {},
      toneGroup = tonal_group_tonesToTonalGroup(coreColorPalette.primary);
      customPalettes[key] = toneGroup;
      palettes = customPalettes;

      final Map map = tonal_group_convertTonalGroupToMap((paletteKeys ?? {})[key], toneGroup);
      for (final mapEntru in map.entries)
        p[mapEntru.key] = mapEntru.value;
    }
  }
  var JSCompiler_temp_final = Object;
  // var JSCompiler_temp_const$jscomp$0 = JSCompiler_temp_const.assign;
  var JSCompiler_temp_const$jscomp$1 = custom_color_convertCustomColors(customColors, sourceColor);

  var JSCompiler_temp_const$jscomp$2 = {
    'primary': p["P-40"],
    'onPrimary': p["P-100"],
    'primaryContainer': p["P-90"],
    'onPrimaryContainer': p["P-10"],
    'secondary': p["S-40"],
    'onSecondary': p["S-100"],
    'secondaryContainer': p["S-90"],
    'onSecondaryContainer': p["S-10"],
    'tertiary': p["T-40"],
    'onTertiary': p["T-100"],
    'tertiaryContainer': p["T-90"],
    'onTertiaryContainer': p["T-10"],
    'error': p["E-40"],
    'errorContainer': p["E-90"],
    'onError': p["E-100"],
    'onErrorContainer': p["E-10"],
    'background': p["N-99"],
    'onBackground': p["N-10"],
    'surface': p["N-99"],
    'onSurface': p["N-10"],
    'surfaceVariant': p["NV-90"],
    'onSurfaceVariant': p["NV-30"],
    'outline': p["NV-50"],
    'inverseOnSurface': p["N-95"],
    'inverseSurface': p["N-20"],
    'inversePrimary': p["P-80"],
    'shadow': p["N-0"],
    'surfaceTint': p["P-40"],
    'outlineVariant': p["NV-80"],
    'scrim': p["N-0"],
  };
  var JSCompiler_inline_result = {
    'primary': p["P-80"],
    'onPrimary': p["P-20"],
    'primaryContainer': p["P-30"],
    'onPrimaryContainer': p["P-90"],
    'secondary': p["S-80"],
    'onSecondary': p["S-20"],
    'secondaryContainer': p["S-30"],
    'onSecondaryContainer': p["S-90"],
    'tertiary': p["T-80"],
    'onTertiary': p["T-20"],
    'tertiaryContainer': p["T-30"],
    'onTertiaryContainer': p["T-90"],
    'error': p["E-80"],
    'errorContainer': p["E-30"],
    'onError': p["E-20"],
    'onErrorContainer': p["E-90"],
    'background': p["N-10"],
    'onBackground': p["N-90"],
    'surface': p["N-10"],
    'onSurface': p["N-90"],
    'surfaceVariant': p["NV-30"],
    'onSurfaceVariant': p["NV-80"],
    'outline': p["NV-60"],
    'inverseOnSurface': p["N-10"],
    'inverseSurface': p["N-90"],
    'inversePrimary': p["P-40"],
    'shadow': p["N-0"],
    'surfaceTint': p["P-80"],
    'outlineVariant': p["NV-30"],
    'scrim': p["N-0"],
  };
  var $jscomp$inline_1016, $jscomp$inline_1018, $jscomp$inline_1020, $jscomp$inline_1022, $jscomp$inline_1024, $jscomp$inline_1026, $jscomp$inline_1028, $jscomp$inline_1030, $jscomp$inline_1032, $jscomp$inline_1034, $jscomp$inline_1036, $jscomp$inline_1038, $jscomp$inline_1040, $jscomp$inline_1042, $jscomp$inline_1044, $jscomp$inline_1046, $jscomp$inline_1048, $jscomp$inline_1050,
  $jscomp$inline_1052, $jscomp$inline_1054, $jscomp$inline_1056, $jscomp$inline_1058, $jscomp$inline_1060, $jscomp$inline_1062, $jscomp$inline_1064;
  var JSCompiler_temp_const$jscomp$3 = {
    'colorAccentPrimary': null != ($jscomp$inline_1016 = p["P-90"]) ? $jscomp$inline_1016 : hexFromArgb(cp.primary.get(90)),
    'colorAccentPrimaryVariant': null != ($jscomp$inline_1018 = p["P-40"]) ? $jscomp$inline_1018 : hexFromArgb(cp.primary.get(40)),
    'colorAccentSecondary': null != ($jscomp$inline_1020 = p["S-90"]) ? $jscomp$inline_1020 : hexFromArgb(cp.secondary.get(90)),
    'colorAccentSecondaryVariant': null != ($jscomp$inline_1022 = p["S-40"]) ? $jscomp$inline_1022 : hexFromArgb(cp.secondary.get(40)),
    'colorAccentTertiary': null != ($jscomp$inline_1024 = p["T-90"]) ? $jscomp$inline_1024 : hexFromArgb(cp.tertiary.get(90)),
    'colorAccentTertiaryVariant': null != ($jscomp$inline_1026 = p["T-40"]) ? $jscomp$inline_1026 : hexFromArgb(cp.tertiary.get(40)),
    'textColorPrimary': null != ($jscomp$inline_1028 = p["N-10"]) ? $jscomp$inline_1028 : hexFromArgb(cp.neutral.get(10)),
    'textColorSecondary': null != ($jscomp$inline_1030 = p["NV-30"]) ? $jscomp$inline_1030 : hexFromArgb(cp.neutralVariant.get(30)),
    'textColorTertiary': null != ($jscomp$inline_1032 = p["NV-50"]) ? $jscomp$inline_1032 : hexFromArgb(cp.neutralVariant.get(50)),
    'textColorPrimaryInverse': null != ($jscomp$inline_1034 = p["N-95"]) ? $jscomp$inline_1034 : hexFromArgb(cp.neutral.get(95)),
    'textColorSecondaryInverse': null != ($jscomp$inline_1036 = p["N-80"]) ? $jscomp$inline_1036 : hexFromArgb(cp.neutral.get(80)),
    'textColorTertiaryInverse': null != ($jscomp$inline_1038 = p["N-60"]) ? $jscomp$inline_1038 : hexFromArgb(cp.neutral.get(60)),
    'colorBackground': null != ($jscomp$inline_1040 = p["N-95"]) ? $jscomp$inline_1040 : hexFromArgb(cp.neutral.get(95)),
    'colorBackgroundFloating': null != ($jscomp$inline_1042 = p["N-98"]) ? $jscomp$inline_1042 : hexFromArgb(cp.neutral.get(98)),
    'colorSurface': null != ($jscomp$inline_1044 = p["N-98"]) ? $jscomp$inline_1044 : hexFromArgb(cp.neutral.get(98)),
    'colorSurfaceVariant': null != ($jscomp$inline_1046 = p["N-90"]) ? $jscomp$inline_1046 : hexFromArgb(cp.neutral.get(90)),
    'colorSurfaceHighlight': null != ($jscomp$inline_1048 = p["N-100"]) ? $jscomp$inline_1048 : hexFromArgb(cp.neutral.get(100)),
    'surfaceHeader': null != ($jscomp$inline_1050 = p["N-90"]) ? $jscomp$inline_1050 : hexFromArgb(cp.neutral.get(90)),
    'underSurface': null != ($jscomp$inline_1052 = p["N-0"]) ? $jscomp$inline_1052 : hexFromArgb(cp.neutral.get(0)),
    'offState': null != ($jscomp$inline_1054 = p["N-20"]) ? $jscomp$inline_1054 : hexFromArgb(cp.neutral.get(20)),
    'accentSurface': null != ($jscomp$inline_1056 = p["NV-95"]) ? $jscomp$inline_1056 : hexFromArgb(cp.secondary.get(95)),
    'textPrimaryOnAccent': null != ($jscomp$inline_1058 = p["N-10"]) ? $jscomp$inline_1058 : hexFromArgb(cp.neutral.get(10)),
    'textSecondaryOnAccent': null != ($jscomp$inline_1060 = p["NV-30"]) ? $jscomp$inline_1060 : hexFromArgb(cp.neutralVariant.get(30)),
    'volumeBackground': null != ($jscomp$inline_1062 = p["N-25"]) ? $jscomp$inline_1062 : hexFromArgb(cp.neutral.get(25)),
    'scrim': null != ($jscomp$inline_1064 = p["N-80"]) ? $jscomp$inline_1064 : hexFromArgb(cp.neutral.get(80))
  };
  var $jscomp$inline_1070, $jscomp$inline_1072, $jscomp$inline_1074, $jscomp$inline_1076, $jscomp$inline_1078, $jscomp$inline_1080,
  $jscomp$inline_1082, $jscomp$inline_1084, $jscomp$inline_1086, $jscomp$inline_1088, $jscomp$inline_1090, $jscomp$inline_1092, $jscomp$inline_1094, $jscomp$inline_1096, $jscomp$inline_1098, $jscomp$inline_1100, $jscomp$inline_1102, $jscomp$inline_1104, $jscomp$inline_1106, $jscomp$inline_1108, $jscomp$inline_1110, $jscomp$inline_1112, $jscomp$inline_1114, $jscomp$inline_1116, $jscomp$inline_1118;
  var JSCompiler_inline_result$jscomp$0 = {
    'colorAccentPrimary': null != ($jscomp$inline_1070 = p["P-90"]) ? $jscomp$inline_1070 : hexFromArgb(cp.primary.get(90)),
    'colorAccentPrimaryVariant': null != ($jscomp$inline_1072 = p["P-70"]) ? $jscomp$inline_1072 : hexFromArgb(cp.primary.get(70)),
    'colorAccentSecondary': null != ($jscomp$inline_1074 = p["S-90"]) ? $jscomp$inline_1074 : hexFromArgb(cp.secondary.get(90)),
    'colorAccentSecondaryVariant': null != ($jscomp$inline_1076 = p["S-70"]) ? $jscomp$inline_1076 : hexFromArgb(cp.secondary.get(70)),
    'colorAccentTertiary': null != ($jscomp$inline_1078 = p["T-90"]) ? $jscomp$inline_1078 : hexFromArgb(cp.tertiary.get(90)),
    'colorAccentTertiaryVariant': null != ($jscomp$inline_1080 = p["T-70"]) ? $jscomp$inline_1080 : hexFromArgb(cp.tertiary.get(70)),
    'textColorPrimary': null != ($jscomp$inline_1082 = p["N-95"]) ? $jscomp$inline_1082 : hexFromArgb(cp.neutral.get(95)),
    'textColorSecondary': null != ($jscomp$inline_1084 = p["NV-80"]) ? $jscomp$inline_1084 : hexFromArgb(cp.neutralVariant.get(80)),
    'textColorTertiary': null != ($jscomp$inline_1086 = p["NV-60"]) ? $jscomp$inline_1086 : hexFromArgb(cp.neutralVariant.get(60)),
    'textColorPrimaryInverse': null != ($jscomp$inline_1088 = p["N-10"]) ? $jscomp$inline_1088 : hexFromArgb(cp.neutral.get(10)),
    'textColorSecondaryInverse': null != ($jscomp$inline_1090 = p["N-30"]) ? $jscomp$inline_1090 : hexFromArgb(cp.neutral.get(30)),
    'textColorTertiaryInverse': null != ($jscomp$inline_1092 = p["N-50"]) ? $jscomp$inline_1092 : hexFromArgb(cp.neutral.get(50)),
    'colorBackground': null != ($jscomp$inline_1094 = p["N-10"]) ? $jscomp$inline_1094 : hexFromArgb(cp.neutral.get(10)),
    'colorBackgroundFloating': null != ($jscomp$inline_1096 = p["N-10"]) ? $jscomp$inline_1096 : hexFromArgb(cp.neutral.get(10)),
    'colorSurface': null != ($jscomp$inline_1098 = p["N-20"]) ? $jscomp$inline_1098 : hexFromArgb(cp.neutral.get(20)),
    'colorSurfaceVariant': null != ($jscomp$inline_1100 = p["N-30"]) ? $jscomp$inline_1100 : hexFromArgb(cp.neutral.get(30)),
    'colorSurfaceHighlight': null != ($jscomp$inline_1102 = p["N-35"]) ? $jscomp$inline_1102 : hexFromArgb(cp.neutral.get(35)),
    'surfaceHeader': null != ($jscomp$inline_1104 = p["N-30"]) ? $jscomp$inline_1104 : hexFromArgb(cp.neutral.get(30)),
    'underSurface': null != ($jscomp$inline_1106 = p["N-0"]) ? $jscomp$inline_1106 : hexFromArgb(cp.neutral.get(0)),
    'offState': null != ($jscomp$inline_1108 = p["N-20"]) ? $jscomp$inline_1108 : hexFromArgb(cp.neutral.get(20)),
    'accentSurface': null != ($jscomp$inline_1110 = p["NV-95"]) ? $jscomp$inline_1110 : hexFromArgb(cp.secondary.get(95)),
    'textPrimaryOnAccent': null != ($jscomp$inline_1112 = p["N-10"]) ? $jscomp$inline_1112 : hexFromArgb(cp.neutral.get(10)),
    'textSecondaryOnAccent': null != ($jscomp$inline_1114 = p["NV-30"]) ? $jscomp$inline_1114 : hexFromArgb(cp.neutralVariant.get(30)),
    'volumeBackground': null != ($jscomp$inline_1116 = p["N-25"]) ? $jscomp$inline_1116 : hexFromArgb(cp.neutral.get(25)),
    'scrim': null != ($jscomp$inline_1118 = p["N-80"]) ? $jscomp$inline_1118 : hexFromArgb(cp.neutral.get(80))
  };

  final _r = Map.from(baseline);
  _r.addAll({
    'baseline': false,
    'seed': sourceColor,
    'extendedColors': null != customColors ? customColors : [],
    'customColors': JSCompiler_temp_const$jscomp$1,
    'schemes': {
      'light': JSCompiler_temp_const$jscomp$2,
      'dark': JSCompiler_inline_result,
      'androidLight': JSCompiler_temp_const$jscomp$3,
      'androidDark': JSCompiler_inline_result$jscomp$0
    },
    'palettes': palettes,
    'coreColors': coreColors,
  });

  return _r;
  // return JSCompiler_temp_const$jscomp$0.call(JSCompiler_temp_const, {}, baseline, {
  //   'baseline': !1,
  //   'seed': sourceColor,
  //   'extendedColors': null != customColors ? customColors : [],
  //   'customColors': JSCompiler_temp_const$jscomp$1,
  //   'schemes': {
  //     'light': JSCompiler_temp_const$jscomp$2,
  //     'dark': JSCompiler_inline_result,
  //     // 'androidLight': JSCompiler_temp_const$jscomp$3,
  //     // 'androidDark': JSCompiler_inline_result$jscomp$0
  //   },
  //   'palettes': palettes,
  //   'coreColors': coreColors,
  // });
}


class MyCustomColor {
  MyCustomColor({
    required this.name,
    required this.harmonized,
    required this.color,
  });

  String name;
  bool harmonized;
  String color;
}

extension _StringX on String {
  String repeat(int count) {
    var r = '';
    for (var i = 0; i < count; i++) {
      r += this;
    }
    return r;
  }
}

extension _BigIntX on BigInt {
  // BigInt operator >>>(BigInt other) {
  //   return this;
  // }
}

Map myJsonConverter(Map data, { required dynamic toEncodable(key, value)}) {
  final newData = <dynamic, dynamic>{};
  newData.addAll(data);

  tourMap(Map<dynamic, dynamic> d) {
    for (final entry in d.entries) {
      var newValue = toEncodable(entry.key, entry.value);
      newValue = newValue is Map ? convertToDynamicMap(newValue) : newValue;
      d[entry.key] = newValue;

      if (newValue is Map) {
        tourMap(newValue);
      }
    }
  }

  tourMap(newData);
  return newData;
}

Map<dynamic, dynamic> convertToDynamicMap(Map v) {
  final newMap = <dynamic, dynamic>{};
  for (final entry in v.entries) {
    newMap[entry.key] = entry.value;
  }
  return newMap;
}



