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
    'brightness': brightness == Brightness.dark ? 'dark' : 'light',
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

  factory MyScheme.fromJson(Map data) {
    return MyScheme(
      brightness: data['brightness'] == 'light' ? Brightness.light : Brightness.dark,
      primary: data['primary'] != null ? MyToken.fromJson(data['primary']) : null,
      onPrimary: data['onPrimary'] != null ? MyToken.fromJson(data['onPrimary']) : null,
      primaryContainer: data['primaryContainer'] != null ? MyToken.fromJson(data['primaryContainer']) : null,
      onPrimaryContainer: data['onPrimaryContainer'] != null ? MyToken.fromJson(data['onPrimaryContainer']) : null,
      secondary: data['secondary'] != null ? MyToken.fromJson(data['secondary']) : null,
      onSecondary: data['onSecondary'] != null ? MyToken.fromJson(data['onSecondary']) : null,
      secondaryContainer: data['secondaryContainer'] != null ? MyToken.fromJson(data['secondaryContainer']) : null,
      onSecondaryContainer: data['onSecondaryContainer'] != null ? MyToken.fromJson(data['onSecondaryContainer']) : null,
      tertiary: data['tertiary'] != null ? MyToken.fromJson(data['tertiary']) : null,
      onTertiary: data['onTertiary'] != null ? MyToken.fromJson(data['onTertiary']) : null,
      tertiaryContainer: data['tertiaryContainer'] != null ? MyToken.fromJson(data['tertiaryContainer']) : null,
      onTertiaryContainer: data['onTertiaryContainer'] != null ? MyToken.fromJson(data['onTertiaryContainer']) : null,
      error: data['error'] != null ? MyToken.fromJson(data['error']) : null,
      onError: data['onError'] != null ? MyToken.fromJson(data['onError']) : null,
      errorContainer: data['errorContainer'] != null ? MyToken.fromJson(data['errorContainer']) : null,
      onErrorContainer: data['onErrorContainer'] != null ? MyToken.fromJson(data['onErrorContainer']) : null,
      outline: data['outline'] != null ? MyToken.fromJson(data['outline']) : null,
      background: data['background'] != null ? MyToken.fromJson(data['background']) : null,
      onBackground: data['onBackground'] != null ? MyToken.fromJson(data['onBackground']) : null,
      surface: data['surface'] != null ? MyToken.fromJson(data['surface']) : null,
      onSurface: data['onSurface'] != null ? MyToken.fromJson(data['onSurface']) : null,
      surfaceVariant: data['surfaceVariant'] != null ? MyToken.fromJson(data['surfaceVariant']) : null,
      onSurfaceVariant: data['onSurfaceVariant'] != null ? MyToken.fromJson(data['onSurfaceVariant']) : null,
      inverseSurface: data['inverseSurface'] != null ? MyToken.fromJson(data['inverseSurface']) : null,
      inverseOnSurface: data['inverseOnSurface'] != null ? MyToken.fromJson(data['inverseOnSurface']) : null,
      inversePrimary: data['inversePrimary'] != null ? MyToken.fromJson(data['inversePrimary']) : null,
      shadow: data['shadow'] != null ? MyToken.fromJson(data['shadow']) : null,
      surfaceTint: data['surfaceTint'] != null ? MyToken.fromJson(data['surfaceTint']) : null,
      outlineVariant: data['outlineVariant'] != null ? MyToken.fromJson(data['outlineVariant']) : null,
      scrim: data['scrim'] != null ? MyToken.fromJson(data['scrim']) : null,
    );
  }

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