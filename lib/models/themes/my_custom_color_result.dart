import 'package:flutter_theme_builder/models/themes/my_core_palette.dart';
import 'package:flutter_theme_builder/models/themes/my_custom_color.dart';
import 'package:flutter_theme_builder/models/themes/my_single_color_scheme.dart';

class MyCustomColorResult extends MyCustomColor {
  MyCustomColorResult({
    required super.name,
    required super.harmonized,
    required super.color,
    required this.light,
    required this.dark,
    required this.palettes,
  });

  MySingleColorScheme light;
  MySingleColorScheme dark;
  MyCorePalette palettes;

  @override
  Map toJson() => {
    'name': name,
    'harmonized': harmonized,
    'color': color,
    'light': light.toJson(),
    'dark': dark.toJson(),
    'palettes': palettes.toJson(),
  };

  @override
  factory MyCustomColorResult.fromJson(Map data) {
    return MyCustomColorResult(
      name: data['name'],
      harmonized: data['harmonized'],
      color: data['color'],
      light: MySingleColorScheme.fromJson(data['light']),
      dark: MySingleColorScheme.fromJson(data['dark']),
      palettes: MyCorePalette.fromJson(data['palettes']),
    );
  }
}


