import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

class Themes {
  Themes(ThemeData light, ThemeData dark)
      : this.light = _wrapTheme(light),
        this.dark = _wrapTheme(dark);

  static ThemeData _wrapTheme(ThemeData theme) {
    final newTheme = theme.copyWith(
      cardTheme: CardTheme(
        elevation: 0,
        color: theme.colorScheme.tertiaryContainer,
      ),
    );

    return newTheme;
  }

  final ThemeData light;
  final ThemeData dark;
}

// TODO:
// module$exports$google3$third_party$javascript$material_color_utilities$palettes$core_palette$CorePalette
class CorePalette {
  CorePalette(this.argb, [this.isContent]) {
    final hct = colorUtilities.Hct.fromInt(argb);
    final hue = hct.hue;
    final chroma = hct.chroma;

    // a1 = fromHueAndChroma();
  }

  dynamic argb;
  dynamic isContent;
  dynamic a1;
  dynamic a2;
  dynamic a3;
  dynamic n1;
  dynamic n2;
  dynamic error;

  factory CorePalette.of(argb) {
    return CorePalette(argb, false);
  }
}

// module$exports$google3$third_party$javascript$material_color_utilities$palettes$tonal_palette$TonalPalette$fromHueAndChroma
fromHueAndChroma(hue, chroma) {
  return TonalPalette(hue, chroma);
}

// module$exports$google3$third_party$javascript$material_color_utilities$palettes$tonal_palette$TonalPalette
class TonalPalette {
  TonalPalette(this.hue, this.chroma) {

  }

  dynamic hue;
  dynamic chroma;
  Map cache = {};

  tone(tone) {
    var argb = this.cache[tone];

    // if (argb != null) {
    //   argb = colorUtilities.Hct(
    //       HctSolver.solveToInt(
    //           this.hue, this.chroma, tone)
    //   ).toInt();
    //   this.cache[tone] = argb;
    // }

    return argb;
  }

}

