import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/app/asset_path.dart';
import 'package:flutter_theme_builder/models/themes.dart';

Future<Themes> generateThemesFromImage(String imagePath) async {
  ImageProvider imageProvider;
  if (AssetPaths.isAsset(imagePath)) {
    imageProvider = AssetImage(imagePath);
  } else {
    imageProvider = FileImage(File(imagePath));
  }

  final lightScheme = await ColorScheme.fromImageProvider(
    provider: imageProvider,
    brightness: Brightness.light,
  );
  final darkScheme = await ColorScheme.fromImageProvider(
    provider: imageProvider,
    brightness: Brightness.dark,
  );

  return Themes(
    ThemeData.from(
      useMaterial3: true,
      colorScheme: lightScheme,
      textTheme: ThemeData.light().textTheme,
    ),
    ThemeData.from(
      useMaterial3: true,
      colorScheme: darkScheme,
      textTheme: ThemeData.dark().textTheme,
    ),
  );
}