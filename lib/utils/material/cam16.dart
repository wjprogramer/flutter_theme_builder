import 'dart:math' as math;

import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:flutter_theme_builder/utils/material/color_hct.dart';
import 'package:flutter_theme_builder/utils/math/math.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

colorUtilities.Cam16 Cam16_fromIntInViewingConditions(int argb) {
  final redL = color_utils_linearized((argb & 16711680) >> 16);
  final greenL = color_utils_linearized((argb & 65280) >> 8);
  final blueL = color_utils_linearized(argb & 255);
  final x = .41233895 * redL + .35762064 * greenL + .18051042 * blueL,
      y = .2126 * redL + .7152 * greenL + .0722 * blueL,
      z = .01932141 * redL + .11916382 * greenL + .95034478 * blueL,
      rD = hct$viewing_conditions$ViewingConditions$DEFAULT.rgbD[0] * (.401288 * x + .650173 * y - .051461 * z),
      gD = hct$viewing_conditions$ViewingConditions$DEFAULT.rgbD[1] * (-.250268 * x + 1.204414 * y + .045854 * z),
      bD = hct$viewing_conditions$ViewingConditions$DEFAULT.rgbD[2] *
          (-.002079 * x + .048952 * y + .953127 * z),
      rAF = math.pow(hct$viewing_conditions$ViewingConditions$DEFAULT.fl * rD.abs() / 100, .42),
      gAF = math.pow(hct$viewing_conditions$ViewingConditions$DEFAULT.fl * gD.abs() / 100, .42),
      bAF = math.pow(hct$viewing_conditions$ViewingConditions$DEFAULT.fl * bD.abs() / 100,
          .42),
      rA = 400 * math_utils_signum(rD) * rAF / (rAF + 27.13),
      gA = 400 * math_utils_signum(gD) * gAF / (gAF + 27.13),
      bA = 400 * math_utils_signum(bD) * bAF / (bAF + 27.13),
      a = (11 * rA + -12 * gA + bA) / 11,
      b = (rA + gA - 2 * bA) / 9,
      atanDegrees = 180 * math.atan2(b, a) / math.pi,
      hue = 0 > atanDegrees ? atanDegrees + 360 : 360 <= atanDegrees ?
      atanDegrees - 360 : atanDegrees,
      hueRadians = hue * math.pi / 180,
      j = 100.0 * math.pow((40 * rA + 20 * gA + bA) / 20 * hct$viewing_conditions$ViewingConditions$DEFAULT.nbb / hct$viewing_conditions$ViewingConditions$DEFAULT.aw, hct$viewing_conditions$ViewingConditions$DEFAULT.c * hct$viewing_conditions$ViewingConditions$DEFAULT.z),
      alpha = math.pow(5E4 / 13.0 * .25 * (math.cos((20.14 > hue ? hue + 360 : hue) * math.pi / 180 + 2) + 3.8) * hct$viewing_conditions$ViewingConditions$DEFAULT.nC * hct$viewing_conditions$ViewingConditions$DEFAULT.ncb * math.sqrt(a * a + b * b) / ((20 * rA + 20 * gA + 21 * bA) / 20 + .305), .9) * math.pow(1.64 - math.pow(.29, hct$viewing_conditions$ViewingConditions$DEFAULT.backgroundYTowhitePointY),
          .73),
      c = alpha * math.sqrt(j / 100),
      mstar = 1 / .0228 * math.log(1 + .0228 * c * hct$viewing_conditions$ViewingConditions$DEFAULT.fLRoot);

  // print('$x, $y, $z');

  return colorUtilities.Cam16(
    /* hue    */ hue,
    /* chroma */ c,
    /* j      */ j.toDouble(),
    /* q      */ 4 / hct$viewing_conditions$ViewingConditions$DEFAULT.c * math.sqrt(j / 100) * (hct$viewing_conditions$ViewingConditions$DEFAULT.aw + 4) * hct$viewing_conditions$ViewingConditions$DEFAULT.fLRoot,
    /* m      */ 0, // FIXME: js 版本沒有這個值
    /* s      */ 50 * math.sqrt(alpha * hct$viewing_conditions$ViewingConditions$DEFAULT.c / (hct$viewing_conditions$ViewingConditions$DEFAULT.aw + 4)),
    /* jstar  */ (1 + 100 * .007) * j / (1 + .007 * j),
    /* astar  */ mstar * math.cos(hueRadians),
    /* bstar  */ mstar * math.sin(hueRadians),
  );
}