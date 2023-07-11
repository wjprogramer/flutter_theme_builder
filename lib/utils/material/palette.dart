import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_theme_builder/extensions/extensions.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/material/cam16.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:flutter_theme_builder/utils/material/color_hct.dart';
import 'package:flutter_theme_builder/utils/math/math.dart';
import 'package:flutter_theme_builder/utils/core/others.dart';
import 'package:material_color_utilities/hct/hct_solver.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

Map<int, String> tonal_group_tonesToTonalGroup(colorUtilities.TonalPalette tonalPalette) {
  return {
    100: hexFromArgb(tonalPalette.get(100)),
    99: hexFromArgb(tonalPalette.get(99)),
    98: hexFromArgb(tonalPalette.get(98)),
    95: hexFromArgb(tonalPalette.get(95)),
    90: hexFromArgb(tonalPalette.get(90)),
    80: hexFromArgb(tonalPalette.get(80)),
    70: hexFromArgb(tonalPalette.get(70)),
    60: hexFromArgb(tonalPalette.get(60)),
    50: hexFromArgb(tonalPalette.get(50)),
    40: hexFromArgb(tonalPalette.get(40)),
    35: hexFromArgb(tonalPalette.get(35)),
    30: hexFromArgb(tonalPalette.get(30)),
    25: hexFromArgb(tonalPalette.get(25)),
    20: hexFromArgb(tonalPalette.get(20)),
    10: hexFromArgb(tonalPalette.get(10)),
    0: hexFromArgb(tonalPalette.get(0)),
  };
}

tonal_group_convertTonalGroupToMap(prefix, colorUtilities.TonalPalette group) {
  final map = {};

  map['${prefix}-100'] = group.get(100);
  map['${prefix}-99'] = group.get(99);
  map['${prefix}-98'] = group.get(98);
  map['${prefix}-95'] = group.get(95);
  map['${prefix}-90'] = group.get(90);
  map['${prefix}-80'] = group.get(80);
  map['${prefix}-70'] = group.get(70);
  map['${prefix}-60'] = group.get(60);
  map['${prefix}-50'] = group.get(50);
  map['${prefix}-40'] = group.get(40);
  map['${prefix}-35'] = group.get(35);
  map['${prefix}-30'] = group.get(30);
  map['${prefix}-25'] = group.get(25);
  map['${prefix}-20'] = group.get(20);
  map['${prefix}-10'] = group.get(10);
  map['${prefix}-0'] = group.get(0);

  return map;
}