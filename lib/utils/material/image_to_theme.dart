import 'dart:typed_data';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter_theme_builder/extensions/extensions.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utilities/theme_utility.dart';
import 'package:flutter_theme_builder/utils/core/image.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

Future<MyDemoThemeData> buildThemeFromImage(String assetPath, {
  List<MyCustomColor> customColors = const [],
  bool isContent = false,
  Int8List? imageData,
}) async {
  final String color = (await getSourceColorsFromImage(assetPath, imageData: imageData))[0];
  final theme = generateDynamicTheme(
    color, customColors: customColors, isContent: isContent,
  );
  return theme;
}

MyDemoThemeData generateDynamicTheme(sourceColor, {
  List<MyCustomColor> customColors = const [],
  bool isContent = false,
}) {
  final source = argbFromHex(sourceColor);
  final light = isContent
      ? colorUtilities.Scheme.lightFromCorePalette(colorUtilities.CorePalette.of(source))
      : colorUtilities.Scheme.lightFromCorePalette(colorUtilities.CorePalette.contentOf(source));
  final dark = isContent
      ? colorUtilities.Scheme.darkFromCorePalette(colorUtilities.CorePalette.of(source))
      : colorUtilities.Scheme.darkFromCorePalette(colorUtilities.CorePalette.contentOf(source));

  final baselineThemeData = ThemeUtility.generateBaselineTheme(
    customColors: customColors,
  );

  baselineThemeData
    ..baseline = false
    ..seed = sourceColor
    ..coreColors = {}
    ..extendedColors = customColors
    ..customColors = custom_color_convertCustomColors(customColors, sourceColor)
    ..lightScheme = light.toMyScheme(Brightness.light)
    ..darkScheme = dark.toMyScheme(Brightness.dark);

  return baselineThemeData;
}

Future<List<String>> getSourceColorsFromImage(String assetPath, {
  Int8List? imageData,
}) async {
  final _pixels = await image_bufferToPixels(assetPath, imageData: imageData);
  final result = await quantizer_celebi$QuantizerCelebi$quantize(_pixels);
  final score = colorUtilities.Score.score(result.colorToCount);

  return score
      .sublist(0, math.min(5, score.length))
      .map((e) => hexFromArgb(e))
      .map((e) => e.toUpperCase()).toList();
}

Future<List<num>> image_bufferToPixels(String assetPath, {
  Int8List? imageData,
}) async {
  final _imageData = imageData ?? (await assetImageToByte(assetPath)).buffer.asInt8List();
  final pixels = <num>[];

  for (var i = 0; i < _imageData.length; i += 3) {
    if (i + 3 >= _imageData.length) {
      continue;
    }
    if (_imageData[i + 3] < 255) {
      pixels.add(color_utils_argbFromRgb(_imageData[i], _imageData[i + 1], _imageData[i + 2]));
    }
  }

  return pixels;
}

Future<colorUtilities.QuantizerResult> quantizer_celebi$QuantizerCelebi$quantize(List<num> pixels$jscomp$0) async {
  return await colorUtilities.QuantizerCelebi().quantize(pixels$jscomp$0.map((e) => e.toInt()), 35937);
}