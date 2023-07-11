import 'dart:math' as math;

import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

final hct$viewing_conditions$ViewingConditions$DEFAULT = (([
  List<double> whitePoint = utils$color_utils_WHITE_POINT_D65,
  _adaptingLuminance,
  double backgroundLstar = 50,
  double surround = 2,
  discountingIlluminant = false,
]) {
  var adaptingLuminance = 200 / math.pi * 100 * utils$color_utils_labInvf(66 / 116) / 100;

  return colorUtilities.ViewingConditions.make(
    whitePoint: whitePoint,
    adaptingLuminance: adaptingLuminance,
    backgroundLstar: backgroundLstar,
    surround: surround,
    discountingIlluminant: discountingIlluminant,
  );
})();