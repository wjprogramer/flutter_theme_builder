import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData(
    useMaterial3: true,
  );

  ThemeData get data => _themeData;

  set data(ThemeData v) {
    _themeData = v;
    notifyListeners();
  }
}