import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/models/themes/my_scheme.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/utils.dart';

class MyDemoThemeData {
  MyDemoThemeData({
    required this.seed,
    required this.name,
    required this.baseline,
    required this.extendedColors,
    required this.coreColors,
    required this.lightScheme,
    required this.darkScheme,
    this.androidSchemes,
    required this.palettes,
    required this.styles,
    this.customColors,
  });

  String seed;
  String name;
  bool baseline;
  List<MyCustomColor> extendedColors;
  Map<String, String?> coreColors;
  MyScheme lightScheme;
  MyScheme darkScheme;
  Map? androidSchemes;
  MyCorePalette palettes;
  dynamic styles;
  dynamic customColors;

  Map toJson() {
    return {
      'seed': seed,
      'name': name,
      'baseline': baseline,
      'extendedColors': extendedColors.map((e) => e.toJson()).toList(),
      'coreColors': coreColors,
      'lightScheme': lightScheme.toJson(),
      'darkScheme': darkScheme.toJson(),
      'androidSchemes': androidSchemes,
      'palettes': palettes.toJson(),
      'styles': styles,
      'customColors': customColors,
    };
  }

  MyDemoThemeData copyWith({
    String? seed,
    String? name,
    bool? baseline,
    List<MyCustomColor>? extendedColors,
    Map<String, String?>? coreColors,
    MyScheme? lightScheme,
    MyScheme? darkScheme,
    Map? androidSchemes,
    MyCorePalette? palettes,
    dynamic styles,
    dynamic customColors,
  }) {
    return MyDemoThemeData(
      seed: seed ?? this.seed,
      name: name ?? this.name,
      baseline: baseline ?? this.baseline,
      extendedColors: extendedColors ?? this.extendedColors,
      coreColors: coreColors ?? this.coreColors,
      lightScheme: lightScheme ?? this.lightScheme,
      darkScheme: darkScheme ?? this.darkScheme,
      androidSchemes: androidSchemes ?? this.androidSchemes,
      palettes: palettes ?? this.palettes,
      styles: styles ?? this.styles,
      customColors: customColors ?? this.customColors,
    );
  }

}