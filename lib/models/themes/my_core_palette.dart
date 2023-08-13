import 'package:flutter_theme_builder/enums/enums.dart';
import 'package:flutter_theme_builder/extensions/extensions.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

class MyCorePalette {
  MyCorePalette({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
    required this.error,
  }) {}

  colorUtilities.TonalPalette primary;
  colorUtilities.TonalPalette secondary;
  colorUtilities.TonalPalette tertiary;
  colorUtilities.TonalPalette neutral;
  colorUtilities.TonalPalette neutralVariant;
  colorUtilities.TonalPalette error;

  Map toJson() {
    return {
      'primary': primary.xToJson(),
      'secondary': secondary.xToJson(),
      'tertiary': tertiary.xToJson(),
      'neutral': neutral.xToJson(),
      'neutralVariant': neutralVariant.xToJson(),
      'error': error.xToJson(),
    };
  }

  factory MyCorePalette.fromJson(Map data) {
    return MyCorePalette(
      primary: _convertJsonToTonalPalette(data['primary']),
      secondary: _convertJsonToTonalPalette(data['secondary']),
      tertiary: _convertJsonToTonalPalette(data['tertiary']),
      neutral: _convertJsonToTonalPalette(data['neutral']),
      neutralVariant: _convertJsonToTonalPalette(data['neutralVariant']),
      error: _convertJsonToTonalPalette(data['error']),
    );
  }

  static colorUtilities.TonalPalette _convertJsonToTonalPalette(Map data) {
    final res = <int>[];

    for (final tone in colorUtilities.TonalPalette.commonTones) {
      res.add(argbFromHex(data[tone.toString()]));
    }

    return colorUtilities.TonalPalette.fromList(res);
  }

  setByKey(MyColorSchemeKey key, colorUtilities.TonalPalette palette) {
    switch (key.code) {
      case 'primary':        primary        = palette; break;
      case 'secondary':      secondary      = palette; break;
      case 'tertiary':       tertiary       = palette; break;
      case 'neutral':        neutral        = palette; break;
      case 'neutralVariant': neutralVariant = palette; break;
      case 'error':          error          = palette; break;
    }
  }

}