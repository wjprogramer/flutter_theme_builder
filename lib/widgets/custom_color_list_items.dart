import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/widgets/tonal_palette_tones_bar.dart';

List<Widget> buildCustomColorListItems(ThemeData themeData, MyCustomColorResult customColorResult, String? name) {
  final textTheme = themeData.textTheme;
  final displayName = name ?? customColorResult.name;

  final singleLightScheme = customColorResult.light;
  final singleDarkScheme = customColorResult.dark;

  final color = Color(singleLightScheme.color);
  final onColor = Color(singleLightScheme.onColor);
  final colorContainer = Color(singleLightScheme.colorContainer);
  final onColorContainer = Color(singleLightScheme.onColorContainer);

  final darkColor = Color(singleDarkScheme.color);
  final darkOnColor = Color(singleDarkScheme.onColor);
  final darkColorContainer = Color(singleDarkScheme.colorContainer);
  final darkOnColorContainer = Color(singleDarkScheme.onColorContainer);

  return [
    Text(
      '$displayName (Light Theme)',
      style: textTheme.titleSmall,
    ),
    8.height,
    Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _buildCell(
              color,
              onColor,
              name: displayName,
              isFirstCol: true,
            ),
          ),
          Expanded(
            child: _buildCell(
              onColor,
              color,
              name: displayName,
            ),
          ),
          Expanded(
            child: _buildCell(
              colorContainer,
              onColorContainer,
              name: displayName,
            ),
          ),
          Expanded(
            child: _buildCell(
              onColorContainer,
              colorContainer,
              name: displayName,
              isLastCol: true,
            ),
          ),
        ],
      ),
    ),
    28.height,
    Text(
      '$displayName (Dark Theme)',
      style: textTheme.titleSmall,
    ),
    8.height,
    Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _buildCell(
              darkColor,
              darkOnColor,
              name: displayName,
              isFirstCol: true,
            ),
          ),
          Expanded(
            child: _buildCell(
              darkOnColor,
              darkColor,
              name: displayName,
            ),
          ),
          Expanded(
            child: _buildCell(
              darkColorContainer,
              darkOnColorContainer,
              name: displayName,
            ),
          ),
          Expanded(
            child: _buildCell(
              darkOnColorContainer,
              darkColorContainer,
              name: displayName,
              isLastCol: true,
            ),
          ),
        ],
      ),
    ),
    28.height,
    Text(
      '$displayName (Tonal Palette)',
      style: textTheme.titleSmall,
    ),
    8.height,
    TonalPaletteTonesBar(
      tonalPalette: customColorResult.palette,
    ),
    8.height,
  ];
}

Widget _buildCell(Color bgColor, Color fgColor, {
  bool isFirstCol = false,
  bool isLastCol = false,
  required String name,
}) {
  return Container(
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.only(
        topLeft: isFirstCol ? Radius.circular(16) : Radius.zero,
        topRight: isLastCol ? Radius.circular(16) : Radius.zero,
        bottomLeft: isFirstCol ? Radius.circular(16) : Radius.zero,
        bottomRight: isLastCol ? Radius.circular(16) : Radius.zero,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Text.rich(
        TextSpan(
          text: '$name\n',
          children: [
            TextSpan(
              text: '#${bgColor.value.toRadixString(16).substring(2)}',
              style: TextStyle(
                fontSize: 10,
                color: fgColor.withOpacity(0.6),
              ),
            ),
          ],
        ),
        style: TextStyle(color: fgColor),
      ),
    ),
  );
}


