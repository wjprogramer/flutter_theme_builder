import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/fragments/custom_theme_fragment.dart';
import 'package:flutter_theme_builder/fragments/dynamic_theme_fragment.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _fragmentType = _FragmentType.dynamic;
  late ThemeData _themeData;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);

    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, ___) {
        return Scaffold(
          appBar: _buildAppBar(context, themeProvider),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(height: 1,),
              Expanded(child: _buildBody()),
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, ThemeProvider themeProvider) {
    return AppBar(
      centerTitle: true,
      // preferredSize: Size.fromHeight(kToolbarHeight),
      leading: IconButton(
        onPressed: () {
        },
        icon: Icon(
          Icons.color_lens_outlined,
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _fragmentType = _FragmentType.dynamic;
              });
            },
            icon: Icon(Icons.auto_awesome),
            label: Text('Dynamic'),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _fragmentType = _FragmentType.custom;
              });
            },
            icon: Icon(Icons.palette),
            label: Text('Custom'),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (themeProvider.data.brightness == Brightness.light) {
              themeProvider.data = ThemeData.dark(useMaterial3: true);
            } else {
              themeProvider.data = ThemeData.light(useMaterial3: true);
            }
          },
          icon: Icon(
            themeProvider.data.brightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info_outline),
        ),
      ],
    );
  }

  Widget _buildBody() {
    switch(_fragmentType) {
      case _FragmentType.dynamic:
        return DynamicThemeFragment();
      case _FragmentType.custom:
        return CustomThemeFragment();
    }
  }
}

enum _FragmentType {
  dynamic,
  custom,
}
