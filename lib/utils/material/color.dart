import 'dart:math' as math;

import 'package:flutter_theme_builder/extensions/extensions.dart';

const utils$color_utils_SRGB_TO_XYZ = [
  [.41233895, .35762064, .18051042],
  [.2126, .7152, .0722],
  [.01932141, .11916382, .95034478]
];
const utils$color_utils_XYZ_TO_SRGB = [
  [3.2413774792388685, -1.5376652402851851, -.49885366846268053],
  [-.9691452513005321, 1.8758853451067872, .04156585616912061],
  [.05562093689691305, -.20395524564742123, 1.0571799111220335]
];
const utils$color_utils_WHITE_POINT_D65 = <double>[95.047, 100, 108.883];

num color_utils_argbFromRgb(red, green, blue) {
  return (-16777216 | (red & 255) << 16 | (green & 255) << 8 | blue & 255).toUnsigned(32); // JS 版本為 `>>> 0`
}

utils$color_utils_labInvf(ft) {
  final ft3 = ft * ft * ft;
  return ft3 > 216 / 24389 ? ft3 : (116 * ft - 16) / (24389 / 27);
}

num color_utils_linearized(int rgbComponent) {
  final normalized = rgbComponent / 255;
  return .040449936 >= normalized
      ? normalized / 12.92 * 100
      : 100 * math.pow((normalized + .055) / 1.055, 2.4);
}

String hexFromArgb(int argb) {
  final g = argb >> 8 & 255,
      b = argb & 255,
      outParts = [(argb >> 16 & 255).toRadixString(16), g.toRadixString(16), b.toRadixString(16)];

  for (var i = 0; i < outParts.length; i++) {
    final part = outParts[i];
    if (1 == part.length) {
      outParts[i] = "0" + part;
    }
  }
  return "#" + outParts.join("");
}

argbFromHex(String h) {
  var hex = h;
  hex = hex.replaceAll("#", "");
  final isThree = 3 == hex.length,
      isSix = 6 == hex.length,
      isEight = 8 == hex.length;
  if (!isThree && !isSix && !isEight) {
    throw Exception("unexpected hex " + hex);
  }
  var r = 0;
  var g = 0;
  var b = 0;

  if (isThree) {
    r = int.parse(hex.substring(0, 1).repeat(2), radix: 16);
    g = int.parse(hex.substring(1, 2).repeat(2), radix: 16);
    b = int.parse(hex.substring(2, 3).repeat(2), radix: 16);
  } else if (isSix) {
    r = int.parse(hex.substring(0, 2), radix: 16);
    g = int.parse(hex.substring(2, 4), radix: 16);
    b = int.parse(hex.substring(4, 6), radix: 16);
  } else if (isEight) {
    r = int.parse(hex.substring(2, 4), radix: 16);
    g = int.parse(hex.substring(4, 6), radix: 16);
    b = int.parse(hex.substring(6, 8), radix: 16);
  }

  return (
      -16777216 |
      (r & 255) << 16 |
      (g & 255) << 8 |
      b & 255
  ).toUnsigned(32); // JS 版本為 `>>> 0`
}

dynamic color_replaceArgbWithHex(key, value) {
  return value is num
      ? hexFromArgb(value.toInt())
      : value;
}


