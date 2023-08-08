import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/app/asset_path.dart';
import 'package:flutter_theme_builder/extensions/material/colors.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:flutter_theme_builder/widgets/hover_builder.dart';
import 'package:provider/provider.dart';

const _IMAGE_LABEL_MARGIN = 5.0;
const _IMAGE_LABEL_BORDER_WIDTH = 2.0;

const _UNSET_COLOR = Colors.transparent;
const _X = const Duration(milliseconds: 300);

class DynamicThemeFragment extends StatefulWidget {
  const DynamicThemeFragment({Key? key}) : super(key: key);

  @override
  State<DynamicThemeFragment> createState() => _DynamicThemeFragmentState();
}

class _DynamicThemeFragmentState extends State<DynamicThemeFragment> with SingleTickerProviderStateMixin {
  var _oldPrimaryColor = _UNSET_COLOR;
  late ThemeProvider _themeProvider;

  @override
  void initState() {
    super.initState();

    _themeProvider = context.read<ThemeProvider>();
    _themeProvider.addListener(_onThemeProviderChanged);
  }

  @override
  void dispose() {
    _themeProvider.removeListener(_onThemeProviderChanged);
    super.dispose();
  }

  void _onThemeProviderChanged() async {
    await Future.delayed(_X);
    _oldPrimaryColor = _themeProvider.themeData.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    if (_oldPrimaryColor == _UNSET_COLOR) {
      _oldPrimaryColor = Theme.of(context).primaryColor;
    }

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
        style: TextStyle(
          fontSize: TempThemeValues.fontSize88,
          height: TempThemeValues.lineHeight11,
        ),
      ),
      20.height,
      Text.rich(
        TextSpan(
          text: 'A user-generated scheme is derived from a user’s wallpaper selection to create 5 key colors with dynamic color. Select a wallpaper or add your own to see user generated color in action.',
          children: [
            TextSpan(
              text: 'Learn more about dynamic color.',
            ),
          ],
        ),
      ),
      16.height,
      Wrap(
        children: [
          AssetPaths.theme1,
          AssetPaths.theme2,
          AssetPaths.theme3,
          AssetPaths.theme4,
        ].map((assetPath) => Padding(
          padding: const EdgeInsets.only(right: 20),
          child: HoverBuilder(
            builder: (isHovered) {
              final isSelected = themeProvider.dynamicThemeImageSource == assetPath;
              final xxColor = isSelected
                  ? _themeProvider.themeData.primaryColor
                  : _oldPrimaryColor;

              Widget child = GestureDetector(
                onTap: () {
                  themeProvider.setThemesByAssetImage(assetPath);
                },
                child: AnimatedContainer(
                  width: isSelected ? 114 : 57,
                  height: 114,
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assetPath),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: isSelected || isHovered
                        ? BorderRadius.circular(8)
                        : BorderRadius.circular(80),
                  ),
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: isSelected ? 1 : 0,
                      duration: _X,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: xxColor,
                        ),
                        child: Icon(
                          Icons.check,
                          color: xxColor.foregroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );

              child = Container(
                padding: isSelected
                    ? const EdgeInsets.all(_IMAGE_LABEL_MARGIN)
                    : const EdgeInsets.symmetric(vertical: _IMAGE_LABEL_MARGIN + _IMAGE_LABEL_BORDER_WIDTH),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: !isSelected ? null : Border.all(
                    color: xxColor,
                    width: _IMAGE_LABEL_BORDER_WIDTH,
                  ),
                ),
                child: child,
              );

              return child;
            },
          ),
        )).toList(),
      ),
      48.height,
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
