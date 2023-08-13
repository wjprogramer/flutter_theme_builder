import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/app/asset_path.dart';
import 'package:flutter_theme_builder/extensions/material/colors.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/models/themes.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:flutter_theme_builder/themes/colors.dart';
import 'package:flutter_theme_builder/utilities/image_utility.dart';
import 'package:flutter_theme_builder/utils/utils.dart';
import 'package:flutter_theme_builder/widgets/color_circle_label.dart';
import 'package:flutter_theme_builder/widgets/demo_mobile_1.dart';
import 'package:flutter_theme_builder/widgets/demo_mobile_2.dart';
import 'package:flutter_theme_builder/widgets/hover_builder.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final _dynamicThemeImageFilePaths = <String>[];

  ThemeData get _theme => _themeProvider.themeData;

  TextStyle? get _descriptionStyle => _theme.textTheme.bodyLarge?.copyWith(
    color: _theme.colorScheme.onSurface.withOpacity(.67),
  );

  final _myCustomColors = <_MyCustomColor>[
    // _MyCustomColor(
    //   name: 'My name 1',
    //   harmonized: true,
    //   color: '#5f5519',
    // ),
    // _MyCustomColor(
    //   name: 'My name 2',
    //   harmonized: false,
    //   color: '#5f5519',
    // ),
  ];

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
                  Expanded(
                    flex: 35,
                    child: _buildLeft(themeProvider, trailingSpace: true),
                  ),
                  Expanded(
                    flex: 55,
                    child: _buildRight(themeProvider),
                  ),
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

  Widget _buildLeft(ThemeProvider themeProvider, {
    required bool trailingSpace,
  }) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
      ),
      children: [
        ..._buildLeftItems(themeProvider),
        if (trailingSpace)
          120.height,
      ],
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
          text: 'A user-generated scheme is derived from a user’s wallpaper selection to create 5 key colors with dynamic color. Select a wallpaper or add your own to see user generated color in action. ',
          children: [
            TextSpan(
              text: 'Learn more about dynamic color.',
              style: TextStyle(
                color: _themeProvider.themeData.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: _themeProvider.themeData.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _openUrl(Uri.parse('https://m3.material.io/styles/color/dynamic-color/overview'));
                },
            ),
          ],
        ),
      ),
      16.height,
      Wrap(
        children: <String?>[
          AssetPaths.theme1,
          AssetPaths.theme2,
          AssetPaths.theme3,
          AssetPaths.theme4,
          ..._dynamicThemeImageFilePaths,
          null,
        ].map((filePath) => _buildImageLabel(
          themeProvider,
          filePath,
        )).toList(),
      ),
      48.height,
      Divider(),
      24.height,
      Text(
        'Extended Colors',
        style: _theme.textTheme.headlineSmall,
      ),
      Text(
        'Input a custom color that automatically gets assigned a set of complementary tones.',
        style: _descriptionStyle,
      ),
      if (_myCustomColors.isNotEmpty)
        Row(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                'Harmonize',
                style: _theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ..._myCustomColors.mapIndexed((e, i) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // _pickColor(
                //   color: e.color,
                //   onColorSelected: (cc) {
                //     setState(() {
                //       e.color = cc;
                //       // _updateThemeByCoreColor();
                //     });
                //   },
                // );
              },
              child: ColorCircleLabel(
                color: e.color,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: e.textEditingController,
              onChanged: (text) {
                setState(() {
                  e.name = text;
                });
              },
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _myCustomColors.removeAt(i);
                // _updateThemeByCoreColor();
              });
            },
            icon: Icon(Icons.delete),
          ),
          Checkbox(
            value: e.harmonized,
            onChanged: (v) {
              setState(() {
                e.harmonized = v ?? e.harmonized;
                // _updateThemeByCoreColor();
              });
            },
          ),
        ],
      )),
      20.height,
      Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                // _myCustomColors.add(_MyCustomColor(
                //   name: 'Hello',
                //   harmonized: true,
                //   color: hexFromArgb(Colors.blue.value),
                // ));
                // _updateThemeByCoreColor();
              });
            },
            style: IconButton.styleFrom(
              backgroundColor: _theme.colorScheme.surfaceVariant,
            ),
            icon: Icon(Icons.add),
          ),
          16.width,
          Text(
            'Add a color',
            style: _theme.textTheme.bodyLarge,
          ),
        ],
      ),
      // 32.height,
      // TextButton(
      //   onPressed: () async {
      //     try {
      //       await themeProvider.setThemesByAssetImage(AssetPaths.theme1);
      //     } catch (e) {
      //     }
      //   },
      //   child: Text('Dynamic'),
      // ),
      32.height,
    ];
  }

  Future<void> _openUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Widget _buildImageLabel(ThemeProvider themeProvider, String? uriPath) {
    final isAssetResource = AssetPaths.isAsset(uriPath ?? '');

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: HoverBuilder(
        builder: (isHovered) {
          final isSelected = themeProvider.dynamicThemeImageSource == uriPath;
          final xxColor = isSelected
              ? _themeProvider.themeData.primaryColor
              : _oldPrimaryColor;

          BoxDecoration? decoration;
          if (uriPath != null) {
            ImageProvider imageProvider;
            if (isAssetResource) {
              imageProvider = AssetImage(uriPath);
            } else {
              imageProvider = FileImage(File(uriPath));
            }

            decoration = BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
              borderRadius: isSelected || isHovered
                  ? BorderRadius.circular(8)
                  : BorderRadius.circular(80),
            );
          } else {
            decoration = BoxDecoration(
              border: Border.all(
                width: _IMAGE_LABEL_BORDER_WIDTH,
                color: _themeProvider.themeData.brightness == Brightness.light
                    ? lightSysOutlineColor
                    : darkSysOutlineColor,
              ),
              borderRadius: isHovered
                  ? BorderRadius.circular(8)
                  : BorderRadius.circular(80),
            );
          }

          Widget child;

          if (uriPath != null) {
            child = AnimatedOpacity(
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
            );
          } else {
            child = Icon(Icons.wallpaper);
          }

          child = GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              if (uriPath != null) {
                themeProvider.setThemesByAssetImage(uriPath);
              } else {
                final file = await ImageUtility.pickImage();
                if (file == null) {
                  return;
                }
                setState(() {
                  _dynamicThemeImageFilePaths.add(file.path);
                });
              }
            },
            child: AnimatedContainer(
              width: isSelected ? 114 : 57,
              height: 114,
              duration: const Duration(milliseconds: 200),
              decoration: decoration,
              child: Center(
                child: child,
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
    );
  }

  List<Widget> _buildRightItems(ThemeProvider themeProvider) {
    return [
      Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 408),
            child: DemoMobile1(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 408),
            child: DemoMobile2(),
          ),
        ],
      ),
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

class _MyCustomColor {
  _MyCustomColor({
    required String name,
    required bool harmonized,
    required String color,
  }) : value = MyCustomColor(name: name, harmonized: harmonized, color: color) {
    textEditingController.text = name;
  }

  MyCustomColor value;
  final textEditingController = TextEditingController();

  String get name => value.name;
  set name(String v) {
    value.name = v;
  }

  bool get harmonized => value.harmonized;
  set harmonized(bool v) {
    value.harmonized = v;
  }

  Color get color => colorFromHex(value.color)!;
  set color(Color v) {
    value.color = hexFromArgb(v.value);
  }

}
