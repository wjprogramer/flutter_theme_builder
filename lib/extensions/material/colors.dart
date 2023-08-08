import 'package:flutter/material.dart';

extension ColorX on Color {

  Color get foregroundColor {
    return computeLuminance() >= 0.5
        ? Colors.black
        : Colors.white;
  }

}