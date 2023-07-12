import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter_theme_builder/extensions/extensions.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/core/image.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

// JSCompiler_StaticMethods_updateThemeFromImage
Future<MyDemoThemeData> buildThemeFromImage(String assetPath, {
  List<MyCustomColor> customColors = const [],
  bool isContent = false,
}) async {
  final color = (await image_sourceColorsFromImage(assetPath))[0];
  final theme = dynamic_generateDynamicTheme(
    color, customColors: customColors, isContent: isContent,
  );

  return theme;
}

dynamic_generateDynamicTheme(sourceColor, {
  List<MyCustomColor> customColors = const [],
  bool isContent = false,
}) {
  final source = argbFromHex(sourceColor);
  final palette = isContent
      ? colorUtilities.CorePalette.contentOf(source)
      : colorUtilities.CorePalette.of(source);
  final light = isContent
      ? colorUtilities.Scheme.lightFromCorePalette(colorUtilities.CorePalette.of(source))
      : colorUtilities.Scheme.lightFromCorePalette(colorUtilities.CorePalette.contentOf(source));
  final dark = isContent
      ? colorUtilities.Scheme.darkFromCorePalette(colorUtilities.CorePalette.of(source))
      : colorUtilities.Scheme.darkFromCorePalette(colorUtilities.CorePalette.contentOf(source));
  final baseline = ThemeTempUtility.baseline_generateBaseline(
    customColors: customColors,
  );

  baseline.baseline = false;
  baseline.seed = sourceColor;
  baseline.coreColors = {};
  baseline.extendedColors = customColors;
  baseline.customColors = custom_color_convertCustomColors(customColors, sourceColor);
  baseline.lightScheme = light.toMyScheme(Brightness.light);
  baseline.darkScheme = dark.toMyScheme(Brightness.dark);

  return baseline;
}

Future<List<String>> image_sourceColorsFromImage(String assetPath) async {
  final pixels = await image_bufferToPixels(assetPath);
  final result = await quantizer_celebi$QuantizerCelebi$quantize(pixels);

  final a = colorUtilities.Score.score(result.colorToCount);
  return a
      .sublist(0, math.min(5, a.length))
      .map((e) => hexFromArgb(e))
      .map((e) => e.toUpperCase()).toList();
}

Future<List<num>> image_bufferToPixels(String assetPath) async {
  final imageData = (await assetImageToByte(assetPath)).buffer.asInt8List();
  final pixels = <num>[];

  for (var i = 0; i < imageData.length; i += 4) {
    if (i + 3 >= imageData.length) {
      continue;
    }
    if (imageData[i + 3] < 255) {
      pixels.add(color_utils_argbFromRgb(imageData[i], imageData[i + 1], imageData[i + 2]));
    }
  }

  return pixels;
}

Future<colorUtilities.QuantizerResult> quantizer_celebi$QuantizerCelebi$quantize(List<num> pixels$jscomp$0) async {
  return await colorUtilities.QuantizerCelebi().quantize(pixels$jscomp$0.map((e) => e.toInt()), 35937);
}