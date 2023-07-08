import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/utils/test.dart';
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

  // 1912
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


