import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/pages/main_page.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (_, themeProvider, ___) {
          final themes = themeProvider.customThemes.getThemes();
          print('app build: ${themeProvider.themeData.brightness}');

          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeProvider.themeData.brightness == Brightness.light
                ? ThemeMode.light
                : ThemeMode.dark,
            theme: themes.light,
            darkTheme: themes.dark,
            debugShowCheckedModeBanner: false,
            home: MainPage(),
          );
        },
      ),
    );
  }
}