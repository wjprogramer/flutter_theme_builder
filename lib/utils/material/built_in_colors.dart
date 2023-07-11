import 'package:flutter/material.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

ColorScheme convertToColorScheme(Brightness brightness, Scheme scheme) {
  return ColorScheme(
    brightness: brightness,
    primary: Color(scheme.primary),
    onPrimary: Color(scheme.onPrimary),
    primaryContainer: Color(scheme.primaryContainer),
    onPrimaryContainer: Color(scheme.onPrimaryContainer),
    secondary: Color(scheme.secondary),
    onSecondary: Color(scheme.onSecondary),
    secondaryContainer: Color(scheme.secondaryContainer),
    onSecondaryContainer: Color(scheme.onSecondaryContainer),
    tertiary: Color(scheme.tertiary),
    onTertiary: Color(scheme.onTertiary),
    tertiaryContainer: Color(scheme.tertiaryContainer),
    onTertiaryContainer: Color(scheme.onTertiaryContainer),
    error: Color(scheme.error),
    onError: Color(scheme.onError),
    errorContainer: Color(scheme.errorContainer),
    onErrorContainer: Color(scheme.onErrorContainer),
    background: Color(scheme.background),
    onBackground: Color(scheme.onBackground),
    surface: Color(scheme.surface),
    onSurface: Color(scheme.onSurface),
    surfaceVariant: Color(scheme.surfaceVariant),
    onSurfaceVariant: Color(scheme.onSurfaceVariant),
    outline: Color(scheme.outline),
    outlineVariant: Color(scheme.outlineVariant),
  );
}
