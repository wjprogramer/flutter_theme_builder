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

  static MyDemoThemeData baseline_generateBaseline({
    List<MyCustomColor> customColors = const [],
  }) {
    final sourceColor = "#6750A4";

    return MyDemoThemeData(
      seed: sourceColor,
      name: "material-theme",
      baseline: true,
      extendedColors: customColors,
      coreColors: {
        'primary': sourceColor,
      },
      lightScheme: baseline_getScheme(Brightness.light),
      darkScheme: baseline_getScheme(Brightness.dark),
      palettes: MyCorePalette(
        primary: baseline_getPalette("primary"),
        secondary: baseline_getPalette("secondary"),
        tertiary: baseline_getPalette("tertiary"),
        error: baseline_getPalette("error"),
        neutral: baseline_getPalette("neutral"),
        neutralVariant: baseline_getPalette("neutral-variant")
      ),
      styles: {
        'display': baseline_getFontStyleGroup("display"),
        'headline': baseline_getFontStyleGroup("headline"),
        'body': baseline_getFontStyleGroup("body"),
        'label': baseline_getFontStyleGroup("label"),
        'title': baseline_getFontStyleGroup("title")
      },
      // 'customColors': custom_color_convertCustomColors(customColors, sourceColor)
    );
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

  static MyToken? baseline_getColorById(String tokenId, String group) {
    return latest_findTokenById(
      tokenId,
      group,
      resolve: true,
      hex: true
    );
  }

  static MyToken? latest_findTokenById(String tokenId, String? vGroup, {
    bool resolve = false,
    bool hex = false,
  }) {
    MyToken? searchGroup(Map group) {
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

  static MyToken latest_convertToken(id, Map value, {
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

    return MyToken(
      name: token['name'],
      value: token['value'],
      id: token['id'],
    );
  }

  static colorUtilities.TonalPalette baseline_getPalette(section$jscomp$0) {
    final prefix = 'md.ref.palette.${section$jscomp$0}';
    final tokens = latest_findAllTokens((section, id) => id.startsWith(prefix) ? true : false);
    final group = {};
    for (final token in tokens) {
      if ("neutral" == section$jscomp$0 && token.id.startsWith('${prefix}-')) {
        continue;
      }
      // 應該是這樣改?
      // Object(group)[Number(token.id.substring(prefix.length))] = token.value
      final x = int.parse((token.id).substring(prefix.length));
      group[x] = token.value;
    }

    int _valueFromMap(int index) {
      final tone = colorUtilities.TonalPalette.commonTones[index];
      return argbFromHex(group[tone]);
    }

    return colorUtilities.TonalPalette.fromList(List.generate(
      colorUtilities.TonalPalette.commonSize,
      _valueFromMap,
    ));
  }

  static List<MyToken> latest_findAllTokens(Function match) {
    final tokens = TOKENS_3P;
    final results = <MyToken>[];

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

  static baseline_getFontStyleGroup(section) {
    return {
      "large": baseline_getFontStyle('${section}-large'),
      "medium": baseline_getFontStyle('${section}-medium'),
      "small": baseline_getFontStyle('${section}-smal'),
    };
  }

  static baseline_getFontStyle(section) {
    final prefix = 'md.sys.typescale.${section}',
        fontFamily = latest_findTokenById('${prefix}.font', null, resolve: true),
        fontWeight = latest_findTokenById('${prefix}.weight', null, resolve: true),
        fontSize = latest_findTokenById('${prefix}.size', null, resolve: true),
        lineHeight = latest_findTokenById('${prefix}.line-height', null, resolve: true),
        tracking = latest_findTokenById('${prefix}.tracking', null, resolve: true),
        fontWeightValue = fontWeight?.value;

    if (fontWeightValue == null) {
      return null;
    }

    return {
      'fontFamilyName': fontFamily?.value['valuesList'][0],
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
      'fontSize': fontSize?.value['value'],
      'lineHeight': lineHeight?.value['value'],
      'letterSpacing': tracking?.value['value'],
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
  MyToken? primary;
  MyToken? onPrimary;
  MyToken? primaryContainer;
  MyToken? onPrimaryContainer;
  MyToken? secondary;
  MyToken? onSecondary;
  MyToken? secondaryContainer;
  MyToken? onSecondaryContainer;
  MyToken? tertiary;
  MyToken? onTertiary;
  MyToken? tertiaryContainer;
  MyToken? onTertiaryContainer;
  MyToken? error;
  MyToken? onError;
  MyToken? errorContainer;
  MyToken? onErrorContainer;
  MyToken? outline;
  MyToken? background;
  MyToken? onBackground;
  MyToken? surface;
  MyToken? onSurface;
  MyToken? surfaceVariant;
  MyToken? onSurfaceVariant;
  MyToken? inverseSurface;
  MyToken? inverseOnSurface;
  MyToken? inversePrimary;
  MyToken? shadow;
  MyToken? surfaceTint;
  MyToken? outlineVariant;
  MyToken? scrim;

  toJson() => {
    'primary': primary?.toJson(),
    'onPrimary': onPrimary?.toJson(),
    'primaryContainer': primaryContainer?.toJson(),
    'onPrimaryContainer': onPrimaryContainer?.toJson(),
    'secondary': secondary?.toJson(),
    'onSecondary': onSecondary?.toJson(),
    'secondaryContainer': secondaryContainer?.toJson(),
    'onSecondaryContainer': onSecondaryContainer?.toJson(),
    'tertiary': tertiary?.toJson(),
    'onTertiary': onTertiary?.toJson(),
    'tertiaryContainer': tertiaryContainer?.toJson(),
    'onTertiaryContainer': onTertiaryContainer?.toJson(),
    'error': error?.toJson(),
    'onError': onError?.toJson(),
    'errorContainer': errorContainer?.toJson(),
    'onErrorContainer': onErrorContainer?.toJson(),
    'outline': outline?.toJson(),
    'background': background?.toJson(),
    'onBackground': onBackground?.toJson(),
    'surface': surface?.toJson(),
    'onSurface': onSurface?.toJson(),
    'surfaceVariant': surfaceVariant?.toJson(),
    'onSurfaceVariant': onSurfaceVariant?.toJson(),
    'inverseSurface': inverseSurface?.toJson(),
    'inverseOnSurface': inverseOnSurface?.toJson(),
    'inversePrimary': inversePrimary?.toJson(),
    'shadow': shadow?.toJson(),
    'surfaceTint': surfaceTint?.toJson(),
    'outlineVariant': outlineVariant?.toJson(),
    'scrim': scrim?.toJson(),
  };

  ColorScheme toColorScheme() {
    _convert(dynamic v) {
      return v is num
          ? fromHex(hexFromArgb(v.toInt()))
          : fromHex(v);
    }

    return ColorScheme(
      brightness: brightness!,

      primary: _convert(primary?.value),
      onPrimary: _convert(onPrimary?.value),
      primaryContainer: _convert(primaryContainer?.value),
      onPrimaryContainer: _convert(onPrimaryContainer?.value),

      secondary: _convert(secondary?.value),
      onSecondary: _convert(onSecondary?.value),
      secondaryContainer: _convert(secondaryContainer?.value),
      onSecondaryContainer: _convert(onSecondaryContainer?.value),

      tertiary: _convert(tertiary?.value),
      onTertiary: _convert(onTertiary?.value),
      tertiaryContainer: _convert(tertiaryContainer?.value),
      onTertiaryContainer: _convert(onTertiaryContainer?.value),

      error: _convert(error?.value),
      onError: _convert(onError?.value),
      errorContainer: _convert(errorContainer?.value),
      onErrorContainer: _convert(onErrorContainer?.value),

      background: _convert(background?.value),
      onBackground: _convert(onBackground?.value),
      surface: _convert(surface?.value),
      onSurface: _convert(onSurface?.value),

      outline: _convert(outline?.value),
      surfaceVariant: _convert(surfaceVariant?.value),
      onSurfaceVariant: _convert(onSurfaceVariant?.value),
    );
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}
