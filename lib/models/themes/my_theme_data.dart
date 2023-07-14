import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/models/themes.dart';

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

  factory MyDemoThemeData.fromJson(Map data) {
    return MyDemoThemeData(
      seed: data['seed'],
      name: data['name'],
      baseline: data['baseline'],
      extendedColors: (data['extendedColors'] as List).map((e) => MyCustomColor.fromJson(e)).toList(),
      coreColors: _coreColorsFromJson(data['coreColors']),
      lightScheme: MyScheme.fromJson(data['lightScheme']),
      darkScheme: MyScheme.fromJson(data['darkScheme']),
      // androidSchemes: data['androidSchemes'],
      palettes: MyCorePalette.fromJson(data['palettes']),
      styles: data['styles'],
      customColors: data['customColors'],
    );
  }

  static Map<String, String?> _coreColorsFromJson(Map data) {
    final res = <String, String?>{};
    data.entries.forEach((e) {
      if (e.key is String && e.value is String?) {
        res[e.key] = e.value;
      }
    });
    return res;
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

  Themes getThemes() {
    return Themes(
      ThemeData.from(
        useMaterial3: true,
        colorScheme: lightScheme.toColorScheme(),
      ),
      ThemeData.from(
        useMaterial3: true,
        colorScheme: darkScheme.toColorScheme(),
      ),
    );
  }

}