import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/enums/enums.dart';
import 'package:flutter_theme_builder/extensions/extensions.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

part 'theme_utility_data.dart';

class ThemeUtility {

  static MyDemoThemeData generateBaselineTheme({
    List<MyCustomColor> customColors = const [],
  }) {
    final sourceColor = "#6750A4";

    final colorUtilities.TonalPalette x = baselineGetPalette("primary");

    print(x.xToJson());

    return MyDemoThemeData(
      seed: sourceColor,
      baseline: true,
      extendedColors: customColors,
      coreColors: {
        MyColorSchemeKey.primary: sourceColor,
      },
      lightScheme: _baseline_getScheme(Brightness.light),
      darkScheme: _baseline_getScheme(Brightness.dark),
      palettes: MyCorePalette(
        primary: baselineGetPalette("primary"),
        secondary: baselineGetPalette("secondary"),
        tertiary: baselineGetPalette("tertiary"),
        error: baselineGetPalette("error"),
        neutral: baselineGetPalette("neutral"),
        neutralVariant: baselineGetPalette("neutral-variant")
      ),
      customColors: custom_color_convertCustomColors(customColors, sourceColor)
    );
  }

  static MyScheme _baseline_getScheme(Brightness brightness) {
    final group = brightness == Brightness.light ? TOKENS_3P_GROUP.light : TOKENS_3P_GROUP.dark;

    return MyScheme(
      brightness: brightness,
      primary:              _baseline_getColorById('md.sys.color.primary', group),
      onPrimary:            _baseline_getColorById('md.sys.color.on-primary', group),
      primaryContainer:     _baseline_getColorById('md.sys.color.primary-container', group),
      onPrimaryContainer:   _baseline_getColorById('md.sys.color.on-primary-container', group),
      secondary:            _baseline_getColorById('md.sys.color.secondary', group),
      onSecondary:          _baseline_getColorById('md.sys.color.on-secondary', group),
      secondaryContainer:   _baseline_getColorById('md.sys.color.secondary-container', group),
      onSecondaryContainer: _baseline_getColorById('md.sys.color.on-secondary-container', group),
      tertiary:             _baseline_getColorById('md.sys.color.tertiary', group),
      onTertiary:           _baseline_getColorById('md.sys.color.on-tertiary', group),
      tertiaryContainer:    _baseline_getColorById('md.sys.color.tertiary-container', group),
      onTertiaryContainer:  _baseline_getColorById('md.sys.color.on-tertiary-container', group),
      error:                _baseline_getColorById('md.sys.color.error', group),
      onError:              _baseline_getColorById('md.sys.color.on-error', group),
      errorContainer:       _baseline_getColorById('md.sys.color.error-container', group),
      onErrorContainer:     _baseline_getColorById('md.sys.color.on-error-container', group),
      outline:              _baseline_getColorById('md.sys.color.outline', group),
      background:           _baseline_getColorById('md.sys.color.background', group),
      onBackground:         _baseline_getColorById('md.sys.color.on-background', group),
      surface:              _baseline_getColorById('md.sys.color.surface', group),
      onSurface:            _baseline_getColorById('md.sys.color.on-surface', group),
      surfaceVariant:       _baseline_getColorById('md.sys.color.surface-variant', group),
      onSurfaceVariant:     _baseline_getColorById('md.sys.color.on-surface-variant', group),
      inverseSurface:       _baseline_getColorById('md.sys.color.inverse-surface', group),
      inverseOnSurface:     _baseline_getColorById('md.sys.color.inverse-on-surface', group),
      inversePrimary:       _baseline_getColorById('md.sys.color.inverse-primary', group),
      shadow:               _baseline_getColorById('md.sys.color.shadow', group),
      surfaceTint:          _baseline_getColorById('md.sys.color.surface-tint', group),
      outlineVariant:       _baseline_getColorById('md.sys.color.outline-variant', group),
      scrim:                _baseline_getColorById('md.sys.color.', group),
    );
  }

  static MyToken? _baseline_getColorById(String tokenId, TOKENS_3P_GROUP group) {
    return _latest_findTokenById(
      tokenId,
      group,
      resolve: true,
      hex: true
    );
  }

  static MyToken<T>? _latest_findTokenById<T>(String tokenId, TOKENS_3P_GROUP? vGroup, {
    bool resolve = false,
    bool hex = false,
  }) {
    MyToken<T>? searchGroup(Map group) {
      for (final entry in group.entries) {
        final id = entry.key;
        final value = entry.value;
        if (id == tokenId) {
          return _latest_convertToken<T>(id, value, resolve: resolve, hex: hex);
        }
      }
      return null;
    }

    const tokens = _TOKENS_3P;
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

  static MyToken<T> _latest_convertToken<T>(id, Map value, {
    required bool resolve,
    required bool hex,
    TOKENS_3P_GROUP? vGroup,
  }) {
    final token = {...value, 'id': id };
    if (
      resolve &&
      token['value'] is String &&
      (token['value'] as String).startsWith('md.')
    ) {
      final match = _latest_findTokenById<T>(token['value'], vGroup, resolve: resolve, hex: hex);
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
      value: token['value'],
      id: token['id'],
    );
  }

  static colorUtilities.TonalPalette baselineGetPalette(section) {
    final prefix = 'md.ref.palette.${section}';

    final tokens = _latest_findAllTokens<String>((section, id) => id.startsWith(prefix) ? true : false);
    final group = {};
    for (final token in tokens) {
      if ("neutral" == section && token.id.startsWith('${prefix}-')) {
        continue;
      }
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

  static List<MyToken<T>> _latest_findAllTokens<T>(Function match) {
    final tokens = _TOKENS_3P;
    final results = <MyToken<T>>[];

    for (final entry in tokens.entries) {
      final section = entry.key,
          group = entry.value;
      for (final gEntry in group.entries) {
        final id = gEntry.key,
            value = gEntry.value;
        if (match(section, id)) {
          final token = _latest_convertToken<T>(
            id, value, resolve: true, hex: true, vGroup: TOKENS_3P_GROUP.palette,
          );
          results.add(token);
        }
      }
    }

    return results;
  }

}


