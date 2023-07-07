import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

part 'theme_temp_utility_data.dart';

class ThemeTempUtility {
  static void test() {
    // final a = baseline_generateBaseline();
    // print(_getPrettyJSONString(a));

    final a = baseline_getColorById('md.sys.color.secondary', 'light');
    print(a);

    final b = baseline_getColorById('md.sys.color.tertiary', 'light');
    print(b);

  }

  static Themes testThemes() {
    return Themes(
      ThemeData.from(
        useMaterial3: true,
        colorScheme: baseline_getScheme(Brightness.light).toColorScheme(),
      ),
        ThemeData.from(
          useMaterial3: true,
          colorScheme: baseline_getScheme(Brightness.dark).toColorScheme(),
        )
    );
  }

  /// My utils
  static String _getPrettyJSONString(jsonObject){
    var encoder = JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }

  /// No. 1 Function
  static baseline_generateBaseline({
    List customColors = const [],
  }) {
    final sourceColor = "#6750A4";
    // final context = options.is3p ? "3p" : "1p";

    final data = {
      'seed': sourceColor,
      'name': "material-theme",
      'baseline': true,
      'extendedColors': customColors,
      'coreColors': {
        'primary': sourceColor
      },
      'schemes': {
        'light': baseline_getScheme(Brightness.light).toJson(),
        'dark': baseline_getScheme(Brightness.dark).toJson(),
      },
      'palettes': {
        'primary': baseline_getPalette("primary"),
        // 'secondary': baseline_getPalette("secondary"),
        // 'tertiary': baseline_getPalette("tertiary"),
        // 'error': baseline_getPalette("error"),
        // 'neutral': baseline_getPalette("neutral"),
        // 'neutralVariant': baseline_getPalette("neutral-variant")
      },
      'styles': {
        'display': baseline_getFontStyleGroup("display"),
        'headline': baseline_getFontStyleGroup("headline"),
        'body': baseline_getFontStyleGroup("body"),
        'label': baseline_getFontStyleGroup("label"),
        'title': baseline_getFontStyleGroup("title")
      },
      // 'customColors': custom_color_convertCustomColors(customColors, sourceColor)
    };

    return data;
  }

  /// No. 2 Function
  static MyScheme baseline_getScheme(Brightness brightness) {
    final group = brightness == Brightness.light ? 'light' : 'dark';

    return MyScheme(
      brightness: brightness,
      primary: baseline_getColorById('md.sys.color.primary', group),
      onPrimary: baseline_getColorById('md.sys.color.on-primary', group),
      primaryContainer: baseline_getColorById('md.sys.color.primary-container', group),
      onPrimaryContainer: baseline_getColorById('md.sys.color.on-primary-container', group),
      secondary: baseline_getColorById('md.sys.color.secondary', group),
      onSecondary: baseline_getColorById('md.sys.color.on-secondary', group),
      secondaryContainer: baseline_getColorById('md.sys.color.secondary-container', group),
      onSecondaryContainer: baseline_getColorById('md.sys.color.on-secondary-container', group),
      tertiary: baseline_getColorById('md.sys.color.tertiary', group),
      onTertiary: baseline_getColorById('md.sys.color.on-tertiary', group),
      tertiaryContainer: baseline_getColorById('md.sys.color.tertiary-container', group),
      onTertiaryContainer: baseline_getColorById('md.sys.color.on-tertiary-container', group),
      error: baseline_getColorById('md.sys.color.error', group),
      onError: baseline_getColorById('md.sys.color.on-error', group),
      errorContainer: baseline_getColorById('md.sys.color.error-container', group),
      onErrorContainer: baseline_getColorById('md.sys.color.on-error-container', group),
      outline: baseline_getColorById('md.sys.color.outline', group),
      background: baseline_getColorById('md.sys.color.background', group),
      onBackground: baseline_getColorById('md.sys.color.on-background', group),
      surface: baseline_getColorById('md.sys.color.surface', group),
      onSurface: baseline_getColorById('md.sys.color.on-surface', group),
      surfaceVariant: baseline_getColorById('md.sys.color.surface-variant', group),
      onSurfaceVariant: baseline_getColorById('md.sys.color.on-surface-variant', group),
      inverseSurface: baseline_getColorById('md.sys.color.inverse-surface', group),
      inverseOnSurface: baseline_getColorById('md.sys.color.inverse-on-surface', group),
      inversePrimary: baseline_getColorById('md.sys.color.inverse-primary', group),
      shadow: baseline_getColorById('md.sys.color.shadow', group),
      surfaceTint: baseline_getColorById('md.sys.color.surface-tint', group),
      outlineVariant: baseline_getColorById('md.sys.color.outline-variant', group),
      scrim: baseline_getColorById('md.sys.color.', group),
    );
  }

  /// No. 3 Function
  static baseline_getColorById(String tokenId, String group) {
    return latest_findTokenById(
      tokenId,
      group,
      resolve: true,
      hex: true
    );
  }

  /// No. 4 Function
  static Map? latest_findTokenById(String tokenId, String? vGroup, {
    bool resolve = false,
    bool hex = false,
  }) {
    Map? searchGroup(Map group) {
      for (final entry in group.entries) {
        final id = entry.key;
        final value = entry.value;
        if (id == tokenId) {
          return latest_convertToken(id, value, resolve: resolve, hex: hex);
        }
      }
      return null;
    }

    const tokens = TOKENS_3P;

    if (vGroup != null) {
      final group = tokens[vGroup];
      if (group != null) {
        final match = searchGroup(group);
        if (match != null) {
          return match;
        }
      }
    }

    for (final group in tokens.entries) {
      final match = searchGroup(group.value);
      if (match != null) {
        return match;
      }
    }
    return null;
  }

  /// No. 5 Function
  static Map latest_convertToken(id, Map value, {
    required bool resolve,
    required bool hex,
    String? vGroup,
  }) {
    final token = {...value, 'id': id };
    if (
      resolve &&
      token['value'] is String &&
      (token['value'] as String).startsWith('md.')
    ) {
      final match = latest_findTokenById(token['value'], vGroup, resolve: resolve, hex: hex);
      if (match != null) {
        return match;
      }
    }

    if (
      hex &&
      token['value'] is Map &&
      token['value']['red'] != null &&
      token['value']['green'] != null &&
      token['value']['blue'] != null
    ) {
      var color = token['value'];
      var red = ((color['red'] as num? ?? 0) * 255.0).round();
      var green = ((color['green'] as num? ?? 0) * 255.0).round();
      var blue = ((color['blue'] as num? ?? 0) * 255.0).round();

      final alpha = color['alpha'] != null
          ? color['alpha']['value'] as num?
          : 1;
      final parts = [
        '${red.toRadixString(16).padLeft(2, '0')}',
        '${green.toRadixString(16).padLeft(2, '0')}',
        '${blue.toRadixString(16).padLeft(2, '0')}',
      ];

      if (color != null && color['alpha'] != null && 1 != alpha) {
        parts.add('${alpha!.toInt().toRadixString(16).padLeft(2, '0')}');
      }

      token['value'] = '#${parts.join().toUpperCase()}';
    }

    return token;
  }

  /// No. 6 Function
  static baseline_getPalette(section$jscomp$0) {
    final prefix = 'md.ref.palette.${section$jscomp$0}';
    final tokens = latest_findAllTokens((section, id) => id.startsWith(prefix) ? true : false);
    final group = {};
    for (final token in tokens) {
      if ("neutral" == section$jscomp$0 && !token['id'].startsWith('${prefix}-')) {
        // 應該是這樣改?
        // Object(group)[Number(token.id.substring(prefix.length))] = token.value
        final x = int.parse((token['id'] as String).substring(prefix.length));
        group[x] = token['value'];
      }
    }
    return group;
  }

  /// No. 7 Function
  static List latest_findAllTokens(Function match) {
    final tokens = TOKENS_3P;
    final results = [];

    for (final entry in tokens.entries) {
      final section = entry.key,
          group = entry.value;
      for (final gEntry in group.entries) {
        final id = gEntry.key,
            value = gEntry.value;
        if (match(section, id)) {
          final token = latest_convertToken(
            id, value, resolve: true, hex: true, vGroup: 'palette',
          );
          results.add(token);
        }
      }
    }
    return results;
  }

  /// No. 8 Function
  static baseline_getFontStyleGroup(section) {
    return {
      "large": baseline_getFontStyle('${section}-large'),
      "medium": baseline_getFontStyle('${section}-medium'),
      "small": baseline_getFontStyle('${section}-smal'),
    };
  }

  /// No. 9 Function
  static baseline_getFontStyle(section) {
    final prefix = 'md.sys.typescale.${section}',
        fontFamily = latest_findTokenById('${prefix}.font', null, resolve: true),
        fontWeight = latest_findTokenById('${prefix}.weight', null, resolve: true),
        fontSize = latest_findTokenById('${prefix}.size', null, resolve: true),
        lineHeight = latest_findTokenById('${prefix}.line-height', null, resolve: true),
        tracking = latest_findTokenById('${prefix}.tracking', null, resolve: true),
        fontWeightValue = fontWeight?['value'];

    if (fontWeightValue == null) {
      return null;
    }

    return {
      'fontFamilyName': fontFamily?['value']['valuesList'][0],
      'fontFamilyStyle': 950 <= fontWeightValue ? "Ultra-black"
          : 900 <= fontWeightValue ? "Black"
          : 800 <= fontWeightValue ?
      "Ultra-bold" : 700 <= fontWeightValue ? "Bold"
          : 600 <= fontWeightValue ? "Demi-bold"
          : 500 <= fontWeightValue ? "Medium"
          : 400 <= fontWeightValue ? "Regular"
          : 300 <= fontWeightValue ? "Light"
          : 200 <= fontWeightValue ? "Extra-light"
          : "Hairline",
      'fontWeight': fontWeightValue,
      'fontSize': fontSize?['value']['value'],
      'lineHeight': lineHeight?['value']['value'],
      'letterSpacing': tracking?['value']['value'],
    };
  }

  /// No. 10 Function
  static custom_color_convertCustomColors(List colors, sourceColor) {
    return colors.map((color$jscomp$0) {
      final sourceValue = argbFromHex(sourceColor);
      var JSCompiler_inline_result = {
        'name': color$jscomp$0.name,
        'value': argbFromHex(color$jscomp$0.color),
        'blend': color$jscomp$0.harmonized ? true : false
      };
      var value = JSCompiler_inline_result['value'];
      final from = value;

      print(from);

      // if (JSCompiler_inline_result['blend']) {
      //   //         colorUtilities.Hct;
      //   final fromHct = new Hct(from),
      //     toHct = new Hct(sourceValue);
      //   value = (new Hct(module$exports$google3$third_party$javascript$material_color_utilities$hct$hct_solver$HctSolver$solveToInt(module$contents$google3$third_party$javascript$material_color_utilities$utils$math_utils_sanitizeDegreesDouble(fromHct.hue +
      //   Math.min(.5 * (180 - Math.abs(Math.abs(fromHct.hue - toHct.hue) - 180)), 15) * (180 >= module$contents$google3$third_party$javascript$material_color_utilities$utils$math_utils_sanitizeDegreesDouble(toHct.hue - fromHct.hue) ? 1 : -1)), fromHct.chroma, fromHct.tone))).toInt()
      // }
      // final tones = module$exports$google3$third_party$javascript$material_color_utilities$palettes$core_palette$CorePalette$of(value).a1;
      // var JSCompiler_inline_result$jscomp$0 = {
      //   'color': JSCompiler_inline_result,
      //   'value': value,
      //   'light': {
      //     'color': tones.tone(40),
      //     'onColor': tones.tone(100),
      //     'colorContainer': tones.tone(90),
      //     'onColorContainer': tones.tone(10)
      //   },
      //   'dark': {
      //     'color': tones.tone(80),
      //     'onColor': tones.tone(20),
      //     'colorContainer': tones.tone(30),
      //     'onColorContainer': tones.tone(90)
      //   },
      // };
      // final color = JSCompiler_inline_result$jscomp$0['color'],
      // json = jsonEncode(JSCompiler_inline_result$jscomp$0, color_replaceArgbWithHex),
      // data = jsonDecode(json);
      //
      // var JSCompiler_inline_result$jscomp$1 = Object.assign({}, data, {
      //   color: {
      //     name: color.name,
      //     harmonized: color.blend,
      //     color: hexFromArgb(color.value)
      //   },
      // });
      //
      // final palette = module$exports$google3$third_party$javascript$material_color_utilities$palettes$core_palette$CorePalette$of(argbFromHex(JSCompiler_inline_result$jscomp$1.value));
      //
      // return {
      //   ...JSCompiler_inline_result$jscomp$1,
      //   'palettes': color_convertCorePalette(palette),
      // };
    });
  }

  /// No. 11 Function
  static hexFromArgb(argb) {
    final g = argb >> 8 & 255,
        b = argb & 255,
        outParts = [(argb >> 16 & 255).toString(16), g.toString(16), b.toString(16)];

    for (var i = 0; i < outParts.length; i++) {
      final part = outParts[i];
      if (1 == part.length) {
        outParts[i] = "0" + part;
      }
    }
    return "#" + outParts.join("");
  }

  /// No. 12 Function
  static argbFromHex(String h) {
    var hex = h;
    hex = hex.replaceAll("#", "");
    final isThree = 3 == hex.length,
      isSix = 6 == hex.length,
      isEight = 8 == hex.length;
    if (!isThree && !isSix && !isEight) {
      throw Exception("unexpected hex " + hex);
    }
    var r = 0,
      g = 0,
      b = 0;

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

    return (-16777216 | (r & 255) << 16 | (g & 255) << 8 | b & 255) >>> 0;
  }

  /// No. 13 Function
  static math_utils_sanitizeDegreesDouble(degrees) {
    var v = degrees;
    v %= 360;
    0 > v && (v += 360);
    return v;
  }

  /// No. 14 Function
  static color_convertCorePalette(palette) {
    return {
      'primary': color_convertTonal(palette.a1),
      'secondary': color_convertTonal(palette.a2),
      'tertiary': color_convertTonal(palette.a3),
      'neutral': color_convertTonal(palette.n1),
      'neutralVariant': color_convertTonal(palette.n2),
      'error': color_convertTonal(palette.error)
    };
  }

  /// No. 15 Function
  static color_convertTonal(palette) {
    var tonalRange = [100, 99, 98, 95, 90, 80, 70, 60, 50, 40, 35, 30, 25, 20, 15, 10, 5, 0];
    const result = {};
    for (final range in tonalRange) {
      final value = palette.tone(range);
      result[range] = hexFromArgb(value);
    }
    return result;
  }

  /// No. 16 Function
  static color_replaceArgbWithHex(key, value) {
    return value is num
        ? hexFromArgb(value)
        : value;
  }

  /// No. 17 Function
  static custom_generateCustomTheme(options) {
    var $jscomp$nullish$tmp222;
    final customColors = null != ($jscomp$nullish$tmp222 = null == options
        ? null
        : options['customColors'])
        ? $jscomp$nullish$tmp222
        : [];
    var $jscomp$nullish$tmp223;
    final c = null != ($jscomp$nullish$tmp223 = options['content']) ? $jscomp$nullish$tmp223 : false,
        coreColors = options['coreColors'],
        baseline = baseline_generateBaseline(
          customColors: options['customColors']
        );
    final sourceColor = null != coreColors['primary']
        ? coreColors['primary']
        : baseline;
    final source = argbFromHex(sourceColor),
        cp = c ? CorePalette(source, true) : CorePalette.of(source);
    // var palettes = {
    //   'primary': tonal_group_tonesToTonalGroup(cp.a1),
    //   'secondary': tonal_group_tonesToTonalGroup(cp.a2),
    //   'tertiary': tonal_group_tonesToTonalGroup(cp.a3),
    //   'neutral': tonal_group_tonesToTonalGroup(cp.n1),
    //   'neutralVariant': tonal_group_tonesToTonalGroup(cp.n2),
    //   'error': tonal_group_tonesToTonalGroup(cp.error),
    // };
    // final paletteKeys = {
    //   'primary': "P",
    //   'secondary': "S",
    //   'tertiary': "T",
    //   'neutral': "N",
    //   'neutralVariant': "NV",
    //   'error': "E"
    // },
    //     p = new Map([...module$contents$google3$ux$material$theme_builder$core$theme$tonal_group_convertTonalGroupToMap(paletteKeys.primary, palettes.primary), ...module$contents$google3$ux$material$theme_builder$core$theme$tonal_group_convertTonalGroupToMap(paletteKeys.secondary, palettes.secondary), ...module$contents$google3$ux$material$theme_builder$core$theme$tonal_group_convertTonalGroupToMap(paletteKeys.tertiary,
    //         palettes.tertiary), ...module$contents$google3$ux$material$theme_builder$core$theme$tonal_group_convertTonalGroupToMap(paletteKeys.neutral, palettes.neutral), ...module$contents$google3$ux$material$theme_builder$core$theme$tonal_group_convertTonalGroupToMap(paletteKeys.neutralVariant, palettes.neutralVariant), ...module$contents$google3$ux$material$theme_builder$core$theme$tonal_group_convertTonalGroupToMap(paletteKeys.error, palettes.error)]);
    // for (final [key__tsickle_destructured_1, value__tsickle_destructured_2] of Object.entries(coreColors)) {
    // final key =
    // key__tsickle_destructured_1,
    // value = value__tsickle_destructured_2;
    // if (value) {
    // final coreColorPalette = module$exports$google3$third_party$javascript$material_color_utilities$palettes$core_palette$CorePalette$of(module$exports$google3$third_party$javascript$material_color_utilities$utils$string_utils$argbFromHex(value)),
    // customPalettes = Object(palettes),
    // toneGroup = tonal_group_tonesToTonalGroup(coreColorPalette.a1);
    // customPalettes[key] = toneGroup;
    // palettes =
    // customPalettes;
    // final map = module$contents$google3$ux$material$theme_builder$core$theme$tonal_group_convertTonalGroupToMap(Object(paletteKeys)[key], toneGroup);
    // for (final [key__tsickle_destructured_3, value__tsickle_destructured_4] of map.entries()) p.set(key__tsickle_destructured_3, value__tsickle_destructured_4)
    // }
    // }
    // var JSCompiler_temp_final = Object,
    // JSCompiler_temp_const$jscomp$0 = JSCompiler_temp_const.assign,
    // JSCompiler_temp_const$jscomp$1 = module$contents$google3$ux$material$theme_builder$core$theme$custom_color_convertCustomColors(customColors,
    // sourceColor);
    // var JSCompiler_temp_const$jscomp$2 = {
    //   'primary': p["P-40"],
    //   'onPrimary': p["P-100"],
    //   'primaryContainer': p["P-90"],
    //   'onPrimaryContainer': p["P-10"],
    //   'secondary': p["S-40"],
    //   'onSecondary': p["S-100"],
    //   'secondaryContainer': p["S-90"],
    //   'onSecondaryContainer': p["S-10"],
    //   'tertiary': p["T-40"],
    //   'onTertiary': p["T-100"],
    //   'tertiaryContainer': p["T-90"],
    //   'onTertiaryContainer': p["T-10"],
    //   'error': p["E-40"],
    //   'errorContainer': p["E-90"],
    //   'onError': p["E-100"],
    //   'onErrorContainer': p["E-10"],
    //   'background': p["N-99"],
    //   'onBackground': p["N-10"],
    //   'surface': p["N-99"],
    //   'onSurface': p["N-10"],
    //   'surfaceVariant': p["NV-90"],
    //   'onSurfaceVariant': p["NV-30"],
    //   'outline': p["NV-50"],
    //   'inverseOnSurface': p["N-95"],
    //   'inverseSurface': p["N-20"],
    //   'inversePrimary': p["P-80"],
    //   'shadow': p["N-0"],
    //   'surfaceTint': p["P-40"],
    //   'outlineVariant': p["NV-80"],
    //   'scrim': p["N-0"],
    // };
    // var JSCompiler_inline_result = {
    //   'primary': p["P-80"],
    //   'onPrimary': p["P-20"],
    //   'primaryContainer': p["P-30"],
    //   'onPrimaryContainer': p["P-90"],
    //   'secondary': p["S-80"],
    //   'onSecondary': p["S-20"],
    //   'secondaryContainer': p["S-30"],
    //   'onSecondaryContainer': p["S-90"],
    //   'tertiary': p["T-80"],
    //   'onTertiary': p["T-20"],
    //   'tertiaryContainer': p["T-30"],
    //   'onTertiaryContainer': p["T-90"],
    //   'error': p["E-80"],
    //   'errorContainer': p["E-30"],
    //   'onError': p["E-20"],
    //   'onErrorContainer': p["E-90"],
    //   'background': p["N-10"],
    //   'onBackground': p["N-90"],
    //   'surface': p["N-10"],
    //   'onSurface': p["N-90"],
    //   'surfaceVariant': p["NV-30"],
    //   'onSurfaceVariant': p["NV-80"],
    //   'outline': p["NV-60"],
    //   'inverseOnSurface': p["N-10"],
    //   'inverseSurface': p["N-90"],
    //   'inversePrimary': p["P-40"],
    //   'shadow': p["N-0"],
    //   'surfaceTint': p["P-80"],
    //   'outlineVariant': p["NV-30"],
    //   'scrim': p["N-0"],
    // };
    // var $jscomp$inline_1016, $jscomp$inline_1018, $jscomp$inline_1020, $jscomp$inline_1022, $jscomp$inline_1024, $jscomp$inline_1026, $jscomp$inline_1028, $jscomp$inline_1030, $jscomp$inline_1032, $jscomp$inline_1034, $jscomp$inline_1036, $jscomp$inline_1038, $jscomp$inline_1040, $jscomp$inline_1042, $jscomp$inline_1044, $jscomp$inline_1046, $jscomp$inline_1048, $jscomp$inline_1050,
    // $jscomp$inline_1052, $jscomp$inline_1054, $jscomp$inline_1056, $jscomp$inline_1058, $jscomp$inline_1060, $jscomp$inline_1062, $jscomp$inline_1064;
    // var JSCompiler_temp_const$jscomp$3 = {
    //   'colorAccentPrimary': null != ($jscomp$inline_1016 = p["P-90"]) ? $jscomp$inline_1016 : hexFromArgb(cp.a1.tone(90)),
    //   'colorAccentPrimaryVariant': null != ($jscomp$inline_1018 = p["P-40"]) ? $jscomp$inline_1018 : hexFromArgb(cp.a1.tone(40)),
    //   'colorAccentSecondary': null != ($jscomp$inline_1020 = p["S-90"]) ? $jscomp$inline_1020 : hexFromArgb(cp.a2.tone(90)),
    //   'colorAccentSecondaryVariant': null != ($jscomp$inline_1022 = p["S-40"]) ? $jscomp$inline_1022 : hexFromArgb(cp.a2.tone(40)),
    //   'colorAccentTertiary': null != ($jscomp$inline_1024 = p["T-90"]) ? $jscomp$inline_1024 : hexFromArgb(cp.a3.tone(90)),
    //   'colorAccentTertiaryVariant': null != ($jscomp$inline_1026 = p["T-40"]) ? $jscomp$inline_1026 : hexFromArgb(cp.a3.tone(40)),
    //   'textColorPrimary': null != ($jscomp$inline_1028 = p["N-10"]) ? $jscomp$inline_1028 : hexFromArgb(cp.n1.tone(10)),
    //   'textColorSecondary': null != ($jscomp$inline_1030 = p["NV-30"]) ? $jscomp$inline_1030 : hexFromArgb(cp.n2.tone(30)),
    //   'textColorTertiary': null != ($jscomp$inline_1032 = p["NV-50"]) ? $jscomp$inline_1032 : hexFromArgb(cp.n2.tone(50)),
    //   'textColorPrimaryInverse': null != ($jscomp$inline_1034 = p["N-95"]) ? $jscomp$inline_1034 : hexFromArgb(cp.n1.tone(95)),
    //   'textColorSecondaryInverse': null != ($jscomp$inline_1036 = p["N-80"]) ? $jscomp$inline_1036 : hexFromArgb(cp.n1.tone(80)),
    //   'textColorTertiaryInverse': null != ($jscomp$inline_1038 = p["N-60"]) ? $jscomp$inline_1038 : hexFromArgb(cp.n1.tone(60)),
    //   'colorBackground': null != ($jscomp$inline_1040 = p["N-95"]) ? $jscomp$inline_1040 : hexFromArgb(cp.n1.tone(95)),
    //   'colorBackgroundFloating': null != ($jscomp$inline_1042 = p["N-98"]) ? $jscomp$inline_1042 : hexFromArgb(cp.n1.tone(98)),
    //   'colorSurface': null != ($jscomp$inline_1044 = p["N-98"]) ? $jscomp$inline_1044 : hexFromArgb(cp.n1.tone(98)),
    //   'colorSurfaceVariant': null != ($jscomp$inline_1046 = p["N-90"]) ? $jscomp$inline_1046 : hexFromArgb(cp.n1.tone(90)),
    //   'colorSurfaceHighlight': null != ($jscomp$inline_1048 = p["N-100"]) ? $jscomp$inline_1048 : hexFromArgb(cp.n1.tone(100)),
    //   'surfaceHeader': null != ($jscomp$inline_1050 = p["N-90"]) ? $jscomp$inline_1050 : hexFromArgb(cp.n1.tone(90)),
    //   'underSurface': null != ($jscomp$inline_1052 = p["N-0"]) ? $jscomp$inline_1052 : hexFromArgb(cp.n1.tone(0)),
    //   'offState': null != ($jscomp$inline_1054 = p["N-20"]) ? $jscomp$inline_1054 : hexFromArgb(cp.n1.tone(20)),
    //   'accentSurface': null != ($jscomp$inline_1056 = p["NV-95"]) ? $jscomp$inline_1056 : hexFromArgb(cp.a2.tone(95)),
    //   'textPrimaryOnAccent': null != ($jscomp$inline_1058 = p["N-10"]) ? $jscomp$inline_1058 : hexFromArgb(cp.n1.tone(10)),
    //   'textSecondaryOnAccent': null != ($jscomp$inline_1060 = p["NV-30"]) ? $jscomp$inline_1060 : hexFromArgb(cp.n2.tone(30)),
    //   'volumeBackground': null != ($jscomp$inline_1062 = p["N-25"]) ? $jscomp$inline_1062 : hexFromArgb(cp.n1.tone(25)),
    //   'scrim': null != ($jscomp$inline_1064 = p["N-80"]) ? $jscomp$inline_1064 : hexFromArgb(cp.n1.tone(80))
    // };
    // var $jscomp$inline_1070, $jscomp$inline_1072, $jscomp$inline_1074, $jscomp$inline_1076, $jscomp$inline_1078, $jscomp$inline_1080,
    // $jscomp$inline_1082, $jscomp$inline_1084, $jscomp$inline_1086, $jscomp$inline_1088, $jscomp$inline_1090, $jscomp$inline_1092, $jscomp$inline_1094, $jscomp$inline_1096, $jscomp$inline_1098, $jscomp$inline_1100, $jscomp$inline_1102, $jscomp$inline_1104, $jscomp$inline_1106, $jscomp$inline_1108, $jscomp$inline_1110, $jscomp$inline_1112, $jscomp$inline_1114, $jscomp$inline_1116, $jscomp$inline_1118;
    // var JSCompiler_inline_result$jscomp$0 = {
    //   'colorAccentPrimary': null != ($jscomp$inline_1070 = p["P-90"]) ? $jscomp$inline_1070 : hexFromArgb(cp.a1.tone(90)),
    //   'colorAccentPrimaryVariant': null != ($jscomp$inline_1072 = p["P-70"]) ? $jscomp$inline_1072 : hexFromArgb(cp.a1.tone(70)),
    //   'colorAccentSecondary': null != ($jscomp$inline_1074 = p["S-90"]) ? $jscomp$inline_1074 : hexFromArgb(cp.a2.tone(90)),
    //   'colorAccentSecondaryVariant': null != ($jscomp$inline_1076 = p["S-70"]) ? $jscomp$inline_1076 : hexFromArgb(cp.a2.tone(70)),
    //   'colorAccentTertiary': null != ($jscomp$inline_1078 = p["T-90"]) ? $jscomp$inline_1078 : hexFromArgb(cp.a3.tone(90)),
    //   'colorAccentTertiaryVariant': null != ($jscomp$inline_1080 = p["T-70"]) ? $jscomp$inline_1080 : hexFromArgb(cp.a3.tone(70)),
    //   'textColorPrimary': null != ($jscomp$inline_1082 = p["N-95"]) ? $jscomp$inline_1082 : hexFromArgb(cp.n1.tone(95)),
    //   'textColorSecondary': null != ($jscomp$inline_1084 = p["NV-80"]) ? $jscomp$inline_1084 : hexFromArgb(cp.n2.tone(80)),
    //   'textColorTertiary': null != ($jscomp$inline_1086 = p["NV-60"]) ? $jscomp$inline_1086 : hexFromArgb(cp.n2.tone(60)),
    //   'textColorPrimaryInverse': null != ($jscomp$inline_1088 = p["N-10"]) ? $jscomp$inline_1088 : hexFromArgb(cp.n1.tone(10)),
    //   'textColorSecondaryInverse': null != ($jscomp$inline_1090 = p["N-30"]) ? $jscomp$inline_1090 : hexFromArgb(cp.n1.tone(30)),
    //   'textColorTertiaryInverse': null != ($jscomp$inline_1092 = p["N-50"]) ? $jscomp$inline_1092 : hexFromArgb(cp.n1.tone(50)),
    //   'colorBackground': null != ($jscomp$inline_1094 = p["N-10"]) ? $jscomp$inline_1094 : hexFromArgb(cp.n1.tone(10)),
    //   'colorBackgroundFloating': null != ($jscomp$inline_1096 = p["N-10"]) ? $jscomp$inline_1096 : hexFromArgb(cp.n1.tone(10)),
    //   'colorSurface': null != ($jscomp$inline_1098 = p["N-20"]) ? $jscomp$inline_1098 : hexFromArgb(cp.n1.tone(20)),
    //   'colorSurfaceVariant': null != ($jscomp$inline_1100 = p["N-30"]) ? $jscomp$inline_1100 : hexFromArgb(cp.n1.tone(30)),
    //   'colorSurfaceHighlight': null != ($jscomp$inline_1102 = p["N-35"]) ? $jscomp$inline_1102 : hexFromArgb(cp.n1.tone(35)),
    //   'surfaceHeader': null != ($jscomp$inline_1104 = p["N-30"]) ? $jscomp$inline_1104 : hexFromArgb(cp.n1.tone(30)),
    //   'underSurface': null != ($jscomp$inline_1106 = p["N-0"]) ? $jscomp$inline_1106 : hexFromArgb(cp.n1.tone(0)),
    //   'offState': null != ($jscomp$inline_1108 = p["N-20"]) ? $jscomp$inline_1108 : hexFromArgb(cp.n1.tone(20)),
    //   'accentSurface': null != ($jscomp$inline_1110 = p["NV-95"]) ? $jscomp$inline_1110 : hexFromArgb(cp.a2.tone(95)),
    //   'textPrimaryOnAccent': null != ($jscomp$inline_1112 = p["N-10"]) ? $jscomp$inline_1112 : hexFromArgb(cp.n1.tone(10)),
    //   'textSecondaryOnAccent': null != ($jscomp$inline_1114 = p["NV-30"]) ? $jscomp$inline_1114 : hexFromArgb(cp.n2.tone(30)),
    //   'volumeBackground': null != ($jscomp$inline_1116 = p["N-25"]) ? $jscomp$inline_1116 : hexFromArgb(cp.n1.tone(25)),
    //   'scrim': null != ($jscomp$inline_1118 = p["N-80"]) ? $jscomp$inline_1118 : hexFromArgb(cp.n1.tone(80))
    // };
    // return JSCompiler_temp_const$jscomp$0.call(JSCompiler_temp_const, {}, baseline, {
    //   baseline: !1,
    //   seed: sourceColor,
    //   extendedColors: null != customColors ? customColors : [],
    //   customColors: JSCompiler_temp_const$jscomp$1,
    //   schemes: {
    //   light: JSCompiler_temp_const$jscomp$2,
    //   dark: JSCompiler_inline_result,
    //   androidLight: JSCompiler_temp_const$jscomp$3,
    //   androidDark: JSCompiler_inline_result$jscomp$0
    //   },
    //   palettes,
    //   coreColors
    // });
  }

  /// No 18.
  static tonal_group_tonesToTonalGroup(tones) {
    return {
      100: hexFromArgb(tones.tone(100)),
      99: hexFromArgb(tones.tone(99)),
      98: hexFromArgb(tones.tone(98)),
      95: hexFromArgb(tones.tone(95)),
      90: hexFromArgb(tones.tone(90)),
      80: hexFromArgb(tones.tone(80)),
      70: hexFromArgb(tones.tone(70)),
      60: hexFromArgb(tones.tone(60)),
      50: hexFromArgb(tones.tone(50)),
      40: hexFromArgb(tones.tone(40)),
      35: hexFromArgb(tones.tone(35)),
      30: hexFromArgb(tones.tone(30)),
      25: hexFromArgb(tones.tone(25)),
      20: hexFromArgb(tones.tone(20)),
      10: hexFromArgb(tones.tone(10)),
      0: hexFromArgb(tones.tone(0))
    };
  }

}

class MyScheme {
  MyScheme({
    this.brightness,
    this.primary,
    this.onPrimary,
    this.primaryContainer,
    this.onPrimaryContainer,
    this.secondary,
    this.onSecondary,
    this.secondaryContainer,
    this.onSecondaryContainer,
    this.tertiary,
    this.onTertiary,
    this.tertiaryContainer,
    this.onTertiaryContainer,
    this.error,
    this.onError,
    this.errorContainer,
    this.onErrorContainer,
    this.outline,
    this.background,
    this.onBackground,
    this.surface,
    this.onSurface,
    this.surfaceVariant,
    this.onSurfaceVariant,
    this.inverseSurface,
    this.inverseOnSurface,
    this.inversePrimary,
    this.shadow,
    this.surfaceTint,
    this.outlineVariant,
    this.scrim,
  });

  Brightness? brightness;
  dynamic primary;
  dynamic onPrimary;
  dynamic primaryContainer;
  dynamic onPrimaryContainer;
  dynamic secondary;
  dynamic onSecondary;
  dynamic secondaryContainer;
  dynamic onSecondaryContainer;
  dynamic tertiary;
  dynamic onTertiary;
  dynamic tertiaryContainer;
  dynamic onTertiaryContainer;
  dynamic error;
  dynamic onError;
  dynamic errorContainer;
  dynamic onErrorContainer;
  dynamic outline;
  dynamic background;
  dynamic onBackground;
  dynamic surface;
  dynamic onSurface;
  dynamic surfaceVariant;
  dynamic onSurfaceVariant;
  dynamic inverseSurface;
  dynamic inverseOnSurface;
  dynamic inversePrimary;
  dynamic shadow;
  dynamic surfaceTint;
  dynamic outlineVariant;
  dynamic scrim;

  toJson() => {
    'primary': primary,
    'onPrimary': onPrimary,
    'primaryContainer': primaryContainer,
    'onPrimaryContainer': onPrimaryContainer,
    'secondary': secondary,
    'onSecondary': onSecondary,
    'secondaryContainer': secondaryContainer,
    'onSecondaryContainer': onSecondaryContainer,
    'tertiary': tertiary,
    'onTertiary': onTertiary,
    'tertiaryContainer': tertiaryContainer,
    'onTertiaryContainer': onTertiaryContainer,
    'error': error,
    'onError': onError,
    'errorContainer': errorContainer,
    'onErrorContainer': onErrorContainer,
    'outline': outline,
    'background': background,
    'onBackground': onBackground,
    'surface': surface,
    'onSurface': onSurface,
    'surfaceVariant': surfaceVariant,
    'onSurfaceVariant': onSurfaceVariant,
    'inverseSurface': inverseSurface,
    'inverseOnSurface': inverseOnSurface,
    'inversePrimary': inversePrimary,
    'shadow': shadow,
    'surfaceTint': surfaceTint,
    'outlineVariant': outlineVariant,
    'scrim': scrim,
  };

  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness!,

      primary: fromHex(primary['value']),
      onPrimary: fromHex(onPrimary['value']),
      primaryContainer: fromHex(primaryContainer['value']),
      onPrimaryContainer: fromHex(onPrimaryContainer['value']),

      secondary: fromHex(secondary['value']),
      onSecondary: fromHex(onSecondary['value']),
      secondaryContainer: fromHex(secondaryContainer['value']),
      onSecondaryContainer: fromHex(onSecondaryContainer['value']),

      tertiary: fromHex(tertiary['value']),
      onTertiary: fromHex(onTertiary['value']),
      tertiaryContainer: fromHex(tertiaryContainer['value']),
      onTertiaryContainer: fromHex(onTertiaryContainer['value']),

      error: fromHex(error['value']),
      onError: fromHex(onError['value']),
      errorContainer: fromHex(errorContainer['value']),
      onErrorContainer: fromHex(onErrorContainer['value']),

      background: fromHex(background['value']),
      onBackground: fromHex(onBackground['value']),
      surface: fromHex(surface['value']),
      onSurface: fromHex(onSurface['value']),

      outline: fromHex(outline['value']),
      surfaceVariant: fromHex(surfaceVariant['value']),
      onSurfaceVariant: fromHex(onSurfaceVariant['value']),
    );
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    print(hexString);
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
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
