import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/utils/utils.dart';

class MyScheme {
  MyScheme({
    this.brightness,
    this.primary,
    this.onPrimary,
    this.primaryContainer,
    this.onPrimaryContainer,
    this.secondary,
    this.onSecondary,
    this.secondaryContainer,
    this.onSecondaryContainer,
    this.tertiary,
    this.onTertiary,
    this.tertiaryContainer,
    this.onTertiaryContainer,
    this.error,
    this.onError,
    this.errorContainer,
    this.onErrorContainer,
    this.outline,
    this.background,
    this.onBackground,
    this.surface,
    this.onSurface,
    this.surfaceVariant,
    this.onSurfaceVariant,
    this.inverseSurface,
    this.inverseOnSurface,
    this.inversePrimary,
    this.shadow,
    this.surfaceTint,
    this.outlineVariant,
    this.scrim,
  });

  Brightness? brightness;
  MyToken? primary;
  MyToken? onPrimary;
  MyToken? primaryContainer;
  MyToken? onPrimaryContainer;
  MyToken? secondary;
  MyToken? onSecondary;
  MyToken? secondaryContainer;
  MyToken? onSecondaryContainer;
  MyToken? tertiary;
  MyToken? onTertiary;
  MyToken? tertiaryContainer;
  MyToken? onTertiaryContainer;
  MyToken? error;
  MyToken? onError;
  MyToken? errorContainer;
  MyToken? onErrorContainer;
  MyToken? outline;
  MyToken? background;
  MyToken? onBackground;
  MyToken? surface;
  MyToken? onSurface;
  MyToken? surfaceVariant;
  MyToken? onSurfaceVariant;
  MyToken? inverseSurface;
  MyToken? inverseOnSurface;
  MyToken? inversePrimary;
  MyToken? shadow;
  MyToken? surfaceTint;
  MyToken? outlineVariant;
  MyToken? scrim;

  toJson() => {
    'primary': primary?.toJson(),
    'onPrimary': onPrimary?.toJson(),
    'primaryContainer': primaryContainer?.toJson(),
    'onPrimaryContainer': onPrimaryContainer?.toJson(),
    'secondary': secondary?.toJson(),
    'onSecondary': onSecondary?.toJson(),
    'secondaryContainer': secondaryContainer?.toJson(),
    'onSecondaryContainer': onSecondaryContainer?.toJson(),
    'tertiary': tertiary?.toJson(),
    'onTertiary': onTertiary?.toJson(),
    'tertiaryContainer': tertiaryContainer?.toJson(),
    'onTertiaryContainer': onTertiaryContainer?.toJson(),
    'error': error?.toJson(),
    'onError': onError?.toJson(),
    'errorContainer': errorContainer?.toJson(),
    'onErrorContainer': onErrorContainer?.toJson(),
    'outline': outline?.toJson(),
    'background': background?.toJson(),
    'onBackground': onBackground?.toJson(),
    'surface': surface?.toJson(),
    'onSurface': onSurface?.toJson(),
    'surfaceVariant': surfaceVariant?.toJson(),
    'onSurfaceVariant': onSurfaceVariant?.toJson(),
    'inverseSurface': inverseSurface?.toJson(),
    'inverseOnSurface': inverseOnSurface?.toJson(),
    'inversePrimary': inversePrimary?.toJson(),
    'shadow': shadow?.toJson(),
    'surfaceTint': surfaceTint?.toJson(),
    'outlineVariant': outlineVariant?.toJson(),
    'scrim': scrim?.toJson(),
  };

  ColorScheme toColorScheme() {
    _convert(dynamic v) {
      return v is num
          ? fromHex(hexFromArgb(v.toInt()))
          : fromHex(v);
    }

    return ColorScheme(
      brightness: brightness!,

      primary: _convert(primary?.value),
      onPrimary: _convert(onPrimary?.value),
      primaryContainer: _convert(primaryContainer?.value),
      onPrimaryContainer: _convert(onPrimaryContainer?.value),

      secondary: _convert(secondary?.value),
      onSecondary: _convert(onSecondary?.value),
      secondaryContainer: _convert(secondaryContainer?.value),
      onSecondaryContainer: _convert(onSecondaryContainer?.value),

      tertiary: _convert(tertiary?.value),
      onTertiary: _convert(onTertiary?.value),
      tertiaryContainer: _convert(tertiaryContainer?.value),
      onTertiaryContainer: _convert(onTertiaryContainer?.value),

      error: _convert(error?.value),
      onError: _convert(onError?.value),
      errorContainer: _convert(errorContainer?.value),
      onErrorContainer: _convert(onErrorContainer?.value),

      background: _convert(background?.value),
      onBackground: _convert(onBackground?.value),
      surface: _convert(surface?.value),
      onSurface: _convert(onSurface?.value),

      outline: _convert(outline?.value),
      surfaceVariant: _convert(surfaceVariant?.value),
      onSurfaceVariant: _convert(onSurfaceVariant?.value),
    );
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}