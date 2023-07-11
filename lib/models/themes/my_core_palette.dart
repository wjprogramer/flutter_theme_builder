import 'package:flutter_theme_builder/extensions/extensions.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
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

  setByKey(String key, colorUtilities.TonalPalette palette) {
    switch (key) {
      case 'primary':        primary        = palette; break;
      case 'secondary':      secondary      = palette; break;
      case 'tertiary':       tertiary       = palette; break;
      case 'neutral':        neutral        = palette; break;
      case 'neutralVariant': neutralVariant = palette; break;
      case 'error':          error          = palette; break;
    }
  }

}