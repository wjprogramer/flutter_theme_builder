import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

class TonalPaletteTonesBar extends StatelessWidget {
  const TonalPaletteTonesBar({
    Key? key,
    required this.tonalPalette,
  }) : super(key: key);

  final colorUtilities.TonalPalette tonalPalette;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: colorUtilities.TonalPalette.commonTones.reversed.map((tone) {
        final bgColor = colorFromHex(hexFromArgb(tonalPalette.get(tone)))!;
        Color fgColor = bgColor.computeLuminance() >= 0.5
            ? Colors.black : Colors.white;

        return Expanded(
          child: Container(
            height: 72,
            alignment: Alignment.center,
            color: bgColor,
            child: Text(tone.toString(), style: TextStyle(color: fgColor),),
          ),
        );
      }).toList(),
    );
  }
}




