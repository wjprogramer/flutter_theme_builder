import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/app/asset_path.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:flutter_theme_builder/themes/compute_themes.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
import 'package:provider/provider.dart';

class DynamicThemeFragment extends StatefulWidget {
  const DynamicThemeFragment({Key? key}) : super(key: key);

  @override
  State<DynamicThemeFragment> createState() => _DynamicThemeFragmentState();
}

class _DynamicThemeFragmentState extends State<DynamicThemeFragment> with SingleTickerProviderStateMixin {
  var _tmp = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, ___) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 720) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _buildLeft(themeProvider)),
                  Expanded(child: _buildRight(themeProvider)),
                ],
              );
            }

            // < 720: 1 column
            return _buildMainList(themeProvider);
            // DemoMobile1
          },
        );
      },
    );
  }

  Widget _buildMainList(ThemeProvider themeProvider) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        ..._buildLeftItems(themeProvider),
        ..._buildRightItems(themeProvider),
      ],
    );
  }

  Widget _buildLeft(ThemeProvider themeProvider) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
      ),
      children: _buildLeftItems(themeProvider),
    );
  }

  Widget _buildRight(ThemeProvider themeProvider) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: _buildRightItems(themeProvider),
      ),
    );
  }

  List<Widget> _buildLeftItems(ThemeProvider themeProvider) {
    return [
      64.height,
      Text(
        'Visualize dynamic color',
      ),
      Text(
        'A user-generated scheme is derived from a user’s wallpaper selection to create 5 key colors with dynamic color. Select a wallpaper or add your own to see user generated color in action.',
      ),
      Text(
        'Learn more about dynamic color.',
      ),

      Wrap(
        children: [
          AssetPaths.theme1,
          AssetPaths.theme2,
          AssetPaths.theme3,
          AssetPaths.theme4,
        ].map((assetPath) => GestureDetector(
          onTap: () {
            computeBuildThemeFromImage(
              assetPath,
            );

            setState(() {
              _tmp = !_tmp;
            });
            return;
            themeProvider.setThemesByAssetImage(assetPath);
          },
          child: AnimatedContainer(
            width: 57,
            height: 114,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetPath),
              ),
              borderRadius: _tmp
                  ? BorderRadius.circular(80)
                  : BorderRadius.circular(8),
            ),
          ),
        )).toList(),
      ),

      32.height,
      TextButton(
        onPressed: () {
        },
        child: Text('Dynamic'),
      ),
      32.height,
      TextButton(
        onPressed: () async {
          try {
            await themeProvider.setThemesByAssetImage(AssetPaths.theme1);
          } catch (e) {
          }
        },
        child: Text('Dynamic'),
      ),
      32.height,

    ];
  }

  List<Widget> _buildRightItems(ThemeProvider themeProvider) {
    return [
      // Center(
      //   child: DemoMobile1(),
      // ),
      Wrap(
        children: [
          ButtonBar(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          FilledButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Button'),
          ),
          TextButton(
            onPressed: null,
            child: Text('Button'),
          ),
        ],
      ),
    ];
  }
}
