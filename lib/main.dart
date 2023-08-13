import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/app/app.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');
    // setWindowMaxSize(const Size(400, 400));
    setWindowMinSize(const Size(800, 800));
  }

  runApp(const MyApp());
}
