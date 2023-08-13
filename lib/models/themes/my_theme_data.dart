import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/enums/enums.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/models/themes.dart';

class MyDemoThemeData {
  MyDemoThemeData({
    required this.seed,
    required this.baseline,
    required this.extendedColors,
    required this.coreColors,
    required this.lightScheme,
    required this.darkScheme,
    this.androidSchemes,
    required this.palettes,
    required this.styles,
    this.customColors = const [],
  });

  String seed;
  bool baseline;
  List<MyCustomColor> extendedColors;
  Map<MyColorSchemeKey, String?> coreColors;
  MyScheme lightScheme;
  MyScheme darkScheme;
  Map? androidSchemes;
  MyCorePalette palettes;
  dynamic styles;
  List<MyCustomColorResult> customColors;

  Map toJson() {
    final jsonCoreColors = <String, String?>{};
    coreColors.forEach((key, value) {
      jsonCoreColors[key.code] = value;
    });

    return {
      'seed': seed,
      'baseline': baseline,
      'extendedColors': extendedColors.map((e) => e.toJson()).toList(),
      'coreColors': jsonCoreColors,
      'lightScheme': lightScheme.toJson(),
      'darkScheme': darkScheme.toJson(),
      'androidSchemes': androidSchemes,
      'palettes': palettes.toJson(),
      'styles': styles,
      'customColors': customColors.map((e) => e.toJson()).toList(),
    };
  }

  factory MyDemoThemeData.fromJson(Map data) {
    return MyDemoThemeData(
      seed: data['seed'],
      baseline: data['baseline'],
      extendedColors: (data['extendedColors'] as List).map((e) => MyCustomColor.fromJson(e)).toList(),
      coreColors: _coreColorsFromJson(data['coreColors']),
      lightScheme: MyScheme.fromJson(data['lightScheme']),
      darkScheme: MyScheme.fromJson(data['darkScheme']),
      // androidSchemes: data['androidSchemes'],
      palettes: MyCorePalette.fromJson(data['palettes']),
      styles: data['styles'],
      customColors: data['customColors'] == null ? [] : (data['customColors'] as List).map((e) => MyCustomColorResult.fromJson(e)).toList(),
    );
  }

  static Map<MyColorSchemeKey, String?> _coreColorsFromJson(Map data) {
    final res = <MyColorSchemeKey, String?>{};
    data.entries.forEach((e) {
      if (e.key is String && e.value is String?) {
        final xxx = MyColorSchemeKey.values.firstWhereOrNull(
              (yyy) => yyy.code == e.key,
        );
        if (xxx != null) {
          res[xxx] = e.value;
        }
      }
    });
    return res;
  }

  MyDemoThemeData copyWith({
    String? seed,
    bool? baseline,
    List<MyCustomColor>? extendedColors,
    Map<MyColorSchemeKey, String?>? coreColors,
    MyScheme? lightScheme,
    MyScheme? darkScheme,
    Map? androidSchemes,
    MyCorePalette? palettes,
    dynamic styles,
    List<MyCustomColorResult>? customColors,
  }) {
    return MyDemoThemeData(
      seed: seed ?? this.seed,
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
        textTheme: ThemeData.light().textTheme,
      ),
      ThemeData.from(
        useMaterial3: true,
        colorScheme: darkScheme.toColorScheme(),
        textTheme: ThemeData.dark().textTheme,
      ),
    );
  }

}