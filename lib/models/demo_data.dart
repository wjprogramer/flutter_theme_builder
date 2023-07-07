import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';

Themes demoData1() {

  return Themes(
      ThemeData.from(
        useMaterial3: true,
        colorScheme: MyScheme(
          brightness: Brightness.light,
          background: { 'value': "#fffbff" },
          error: { 'value': "#ba1a1a" },
          errorContainer: { 'value': "#ffdad6" },
          inverseOnSurface: { 'value': "#f6edff" },
          inversePrimary: { 'value': "#52dbcb" },
          inverseSurface: { 'value': "#3a1d71" },
          onBackground: { 'value': "#24005a" },
          onError: { 'value': "#ffffff" },
          onErrorContainer: { 'value': "#410002" },
          onPrimary: { 'value': "#ffffff" },
          onPrimaryContainer: { 'value': "#00201d" },
          onSecondary: { 'value': "#ffffff" },
          onSecondaryContainer: { 'value': "#231b00" },
          onSurface: { 'value': "#24005a" },
          onSurfaceVariant: { 'value': "#3f4947" },
          onTertiary: { 'value': "#ffffff" },
          onTertiaryContainer: { 'value': "#310048" },
          outline: { 'value': "#6f7977" },
          outlineVariant: { 'value': "#bec9c6" },
          primary: { 'value': "#006a61" },
          primaryContainer: { 'value': "#73f8e8" },
          scrim: { 'value': "#000000" },
          secondary: { 'value': "#735c00" },
          secondaryContainer: { 'value': "#ffe083" },
          shadow: { 'value': "#000000" },
          surface: { 'value': "#fffbff" },
          surfaceTint: { 'value': "#006a61" },
          surfaceVariant: { 'value': "#dae5e2" },
          tertiary: { 'value': "#7d4996" },
          tertiaryContainer: { 'value': "#f6d9ff" },
        ).toColorScheme(),
      ),
      ThemeData.from(
        useMaterial3: true,
        colorScheme: MyScheme(
          brightness: Brightness.dark,
          background: { 'value': "#24005a" },
          error: { 'value': "#ffb4ab" },
          errorContainer: { 'value': "#93000a" },
          inverseOnSurface: { 'value': "#24005a" },
          inversePrimary: { 'value': "#006a61" },
          inverseSurface: { 'value': "#eaddff" },
          onBackground: { 'value': "#eaddff" },
          onError: { 'value': "#690005" },
          onErrorContainer: { 'value': "#ffdad6" },
          onPrimary: { 'value': "#003732" },
          onPrimaryContainer: { 'value': "#73f8e8" },
          onSecondary: { 'value': "#3c2f00" },
          onSecondaryContainer: { 'value': "#ffe083" },
          onSurface: { 'value': "#eaddff" },
          onSurfaceVariant: { 'value': "#bec9c6" },
          onTertiary: { 'value': "#4a1764" },
          onTertiaryContainer: { 'value': "#f6d9ff" },
          outline: { 'value': "#899390" },
          outlineVariant: { 'value': "#3f4947" },
          primary: { 'value': "#52dbcb" },
          primaryContainer: { 'value': "#005049" },
          scrim: { 'value': "#000000" },
          secondary: { 'value': "#e8c349" },
          secondaryContainer: { 'value': "#574500" },
          shadow: { 'value': "#000000" },
          surface: { 'value': "#24005a" },
          surfaceTint: { 'value': "#52dbcb" },
          surfaceVariant: { 'value': "#3f4947" },
          tertiary: { 'value': "#e9b3ff" },
          tertiaryContainer: { 'value': "#63307c" },
        ).toColorScheme(),
      )
  );


}

