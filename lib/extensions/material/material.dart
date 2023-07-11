import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

extension _BigIntX on BigInt {
  // BigInt operator >>>(BigInt other) {
  //   return this;
  // }
}

extension TonalPaletteX on colorUtilities.TonalPalette {
  Map xToJson() {
    var tonalRange = [100, 99, 98, 95, 90, 80, 70, 60, 50, 40, 35, 30, 25, 20, 15, 10, 5, 0];
    final result = {};
    for (final range in tonalRange) {
      final value = this.get(range);
      result[range.toString()] = hexFromArgb(value);
    }
    return result;
  }
}

extension CorePalette on colorUtilities.CorePalette {
  MyCorePalette toMyCorePalette() {
    return MyCorePalette(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
      neutral: neutral,
      neutralVariant: neutralVariant,
      error: error,
    );
  }
}