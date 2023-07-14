import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/test/test.dart';
import 'package:flutter_theme_builder/widgets/demo_mobile_1.dart';
import 'package:flutter_theme_builder/widgets/hover_builder.dart';
import 'package:provider/provider.dart';

const _INSTANT_APPLY_CORE_COLOR_CHANGES = true;

typedef _ColorSelected = Function(Color color);

class CustomThemeFragment extends StatefulWidget {
  const CustomThemeFragment({Key? key}) : super(key: key);

  @override
  State<CustomThemeFragment> createState() => _CustomThemeFragmentState();
}

class _CustomThemeFragmentState extends State<CustomThemeFragment> {
  var _initialized = false;
  late ThemeProvider _themeProvider;
  ThemeData _themeData = ThemeData();
  TextTheme get _textTheme => _themeData.textTheme;
  late ColorScheme _colorScheme;

  Color _primaryColor = Colors.white;

  Color? __secondaryColor = Colors.white;
  Color get _secondaryColor => __secondaryColor!;

  Color? __tertiaryColor = Colors.white;
  Color get _tertiaryColor => __tertiaryColor!;

  Color? __neutralColor = Colors.white;
  Color get _neutralColor => __neutralColor!;

  final _leftFocusNode = FocusNode();

  var _cellsCopiedStatus = <List<bool>>[];
  var _colorRows = <List<_SchemeColorCell>>[];
  var _lockOtherCoreColors = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_timeStamp) {
      _onThemeChanged(Theme.of(context));

      final themeProvider = context.read<ThemeProvider>();
      _primaryColor = themeProvider.themeData.colorScheme.primary;
      __secondaryColor = themeProvider.themeData.colorScheme.secondary;
      __tertiaryColor = themeProvider.themeData.colorScheme.tertiary;
      __neutralColor = themeProvider.themeData.colorScheme.surface;

      themeProvider.addListener(_listenThemeProvider);

      setState(() {
        _initialized = true;
      });
    });
  }

  @override
  void dispose() {
    _themeProvider.removeListener(_listenThemeProvider);
    super.dispose();
  }

  void _listenThemeProvider() {
    _onThemeChanged(_themeProvider.themeData);

    setState(() { });
  }

  void _onThemeChanged(ThemeData theme) {
    _themeData = theme;
    _colorScheme = _themeData.colorScheme;

    _colorRows = <List<_SchemeColorCell>>[
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Primary',
          bgColor: _colorScheme.primary,
          textColor: _colorScheme.onPrimary,
          height: 118,
        ),
        _SchemeColorCell(
          name: 'On Primary',
          bgColor: _colorScheme.onPrimary,
          textColor: _colorScheme.primary,
          height: 118,
        ),
        _SchemeColorCell(
          name: 'Primary Container',
          bgColor: _colorScheme.primaryContainer,
          textColor: _colorScheme.onPrimaryContainer,
          height: 118,
        ),
        _SchemeColorCell(
          name: 'On Primary Container',
          bgColor: _colorScheme.onPrimaryContainer,
          textColor: _colorScheme.primaryContainer,
          height: 118,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Secondary',
          bgColor: _colorScheme.secondary,
          textColor: _colorScheme.onSecondary,
        ),
        _SchemeColorCell(
          name: 'On Secondary',
          bgColor: _colorScheme.onSecondary,
          textColor: _colorScheme.secondary,
        ),
        _SchemeColorCell(
          name: 'Secondary Container',
          bgColor: _colorScheme.secondaryContainer,
          textColor: _colorScheme.onSecondaryContainer,
        ),
        _SchemeColorCell(
          name: 'On Secondary Container',
          bgColor: _colorScheme.onSecondaryContainer,
          textColor: _colorScheme.secondaryContainer,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Tertiary',
          bgColor: _colorScheme.tertiary,
          textColor: _colorScheme.onTertiary,
        ),
        _SchemeColorCell(
          name: 'On Tertiary',
          bgColor: _colorScheme.onTertiary,
          textColor: _colorScheme.tertiary,
        ),
        _SchemeColorCell(
          name: 'Tertiary Container',
          bgColor: _colorScheme.tertiaryContainer,
          textColor: _colorScheme.onTertiaryContainer,
        ),
        _SchemeColorCell(
          name: 'On Tertiary Container',
          bgColor: _colorScheme.onTertiaryContainer,
          textColor: _colorScheme.tertiaryContainer,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Error',
          bgColor: _colorScheme.error,
          textColor: _colorScheme.onError,
        ),
        _SchemeColorCell(
          name: 'On Error',
          bgColor: _colorScheme.onError,
          textColor: _colorScheme.error,
        ),
        _SchemeColorCell(
          name: 'Error Container',
          bgColor: _colorScheme.errorContainer,
          textColor: _colorScheme.onErrorContainer,
        ),
        _SchemeColorCell(
          name: 'On Error Container',
          bgColor: _colorScheme.onErrorContainer,
          textColor: _colorScheme.errorContainer,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Background',
          bgColor: _colorScheme.background,
          textColor: _colorScheme.onBackground,
        ),
        _SchemeColorCell(
          name: 'On Background',
          bgColor: _colorScheme.onBackground,
          textColor: _colorScheme.background,
        ),
        _SchemeColorCell(
          name: 'Surface',
          bgColor: _colorScheme.surface,
          textColor: _colorScheme.onSurface,
        ),
        _SchemeColorCell(
          name: 'On Surface',
          bgColor: _colorScheme.onSurface,
          textColor: _colorScheme.surface,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Outline',
          bgColor: _colorScheme.outline,
          textColor: _colorScheme.background,
          flex: 2,
        ),
        _SchemeColorCell(
          name: 'Surface Variant',
          bgColor: _colorScheme.surfaceVariant,
          textColor: _colorScheme.onSurfaceVariant,
        ),
        _SchemeColorCell(
          name: 'On Surface Variant',
          bgColor: _colorScheme.onSurfaceVariant,
          textColor: _colorScheme.surfaceVariant,
        ),
      ],
    ];
    _tryResetCopiedStatus(_colorRows);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return Consumer<ThemeProvider>(
          builder: (_, themeProvider, ___) {
            _themeProvider = themeProvider;

            if (!_initialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // >= 935: 2 column
            if (maxWidth > 935) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _buildLeft()),
                  VerticalDivider(width: 1),
                  Expanded(flex: 2, child: _buildRight()),
                ],
              );
            }

            return _buildMain();
          }
        );
      },
    );
  }

  Widget _buildLeft() {
    return SelectionArea(
      focusNode: _leftFocusNode,
      child: ListView(
        children: [
          64.height,
          ...[
            Text(
              'Build a custom color scheme to map dynamic color, use as fallback colors, or implement a branded theme. The color system automatically handles critical adjustments that provide accessible color contrast. Learn more about color roles.',
              style: _textTheme.bodyLarge,
            ),
            18.height,
            Text(
              'Core colors',
              style: _textTheme.titleLarge,
            ),
            18.height,
            Text(
              'Input one or more brand color to define your color scheme.',
              style: _textTheme.bodyLarge,
            ),
            10.height,
            ...[
              _coreColorCard(
                isPrimary: true,
                title: 'Primary',
                subtitle: 'Acts as custom source color',
                color: _themeData.colorScheme.primary,
                onColorSelected: (color) {
                  setState(() {
                    _primaryColor = color;
                    _updateThemeByCoreColor();
                  });
                }
              ),
              _coreColorCard(
                title: 'Secondary',
                color: _themeData.colorScheme.secondary,
                onColorSelected: (color) {
                  setState(() {
                    __secondaryColor = color;
                    _updateThemeByCoreColor();
                  });
                },
              ),
              _coreColorCard(
                title: 'Tertiary',
                color: _themeData.colorScheme.tertiary,
                onColorSelected: (color) {
                  setState(() {
                    __tertiaryColor = color;
                    _updateThemeByCoreColor();
                  });
                },
              ),
              _coreColorCard(
                title: 'Neutral',
                subtitle: 'Used for background and surfaces',
                color: _themeData.colorScheme.surface,
                onColorSelected: (color) {
                  setState(() {
                    __neutralColor = color;
                    _updateThemeByCoreColor();
                  });
                },
              ),
            ].map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: e,
            )),
            36.height,
            Text(
              'Extended Colors',
              style: _textTheme.headlineSmall,
            ),
            Text(
              'Input a custom color that automatically gets assigned a set of complementary tones.',
              style: _textTheme.bodyLarge,
            ),
          ].map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: e,
          )),
          20.height,
        ],
      ),
    );
  }

  void _updateThemeByCoreColor() {
    _themeProvider.setThemes(
      primaryColor: _primaryColor,
      secondaryColor: _lockOtherCoreColors ? null : _secondaryColor,
      tertiaryColor: _lockOtherCoreColors ? null : _tertiaryColor,
      neutralColor: _lockOtherCoreColors ? null : _neutralColor,
    );
  }

  Widget _coreColorCard({
    required String title,
    String? subtitle,
    required Color color,
    required _ColorSelected onColorSelected,
    bool isPrimary = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _themeData.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(24),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: subtitle != null
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: !isPrimary && _lockOtherCoreColors ? null : () => _pickColor(
                color: color,
                onColorSelected: onColorSelected,
              ),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
            ),
            8.width,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: _textTheme.bodyLarge?.copyWith(
                      color: _themeData.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (subtitle != null)
                    SelectableText(
                      subtitle,
                      textAlign: TextAlign.start,
                      style: _textTheme.bodySmall?.copyWith(
                        color: _themeData.colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
            if (isPrimary)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Checkbox(
                    value: _lockOtherCoreColors,
                    onChanged: (v) {
                      setState(() {
                        _lockOtherCoreColors = v ?? _lockOtherCoreColors;
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickColor({
    required Color color,
    required _ColorSelected onColorSelected,
  }) async {
    Color resultColor = _primaryColor;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          content: SingleChildScrollView(
            child: SlidePicker(
              pickerColor: _INSTANT_APPLY_CORE_COLOR_CHANGES ? resultColor : _primaryColor,
              onColorChanged: (v) {
                resultColor = v;
                if (_INSTANT_APPLY_CORE_COLOR_CHANGES) {
                  onColorSelected(v);
                }
              },
              colorModel: ColorModel.hsv,
              enableAlpha: false,
              displayThumbColor: true,
              showParams: true,
              showIndicator: true,
              indicatorBorderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
          ),
        );
      },
    );

    onColorSelected(resultColor);
  }

  Widget _buildRight() {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        ..._buildRightListItems(),
      ],
    );
  }

  Widget _buildMain() {
    final items = [
      ..._buildRightListItems(),
    ];

    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (c, i) => items[i],
    );
  }

  List<Widget> _buildRightListItems() {
    final themes = _themeProvider.customThemes.getThemes();
    final lightTheme = themes.light;
    final darkTheme = themes.dark;

    testSomething();
    ThemeTempUtility.test();
    ThemeTempUtility.testThemes();

    return [
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 408),
          child: DemoMobile1(),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 192),
            child: TextField(),
          ),
          32.width,
        ],
      ),
      _buildScheme(lightTheme),
      _buildScheme(darkTheme),
    ];
  }

  Widget _buildScheme(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${theme.brightness == Brightness.light ? 'Light' : 'Dark'} Scheme',
            textAlign: TextAlign.start,
          ),
          16.height,
          ..._colorRows.mapIndexed((row, ri) {
            final isLastRow = ri == (_colorRows.length - 1);
            final isFirstRow = ri == 0;

            return Padding(
              padding: isLastRow
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  ...row.mapIndexed((cell, ci) {
                    return Expanded(
                      flex: cell.flex,
                      child: HoverBuilder(
                        builder: (isHovered) {
                          return Container(
                            padding: const EdgeInsets.all(14),
                            height: cell.height,
                            decoration: BoxDecoration(
                              color: cell.bgColor,
                              borderRadius: BorderRadius.only(
                                topLeft: isFirstRow && ci == 0 ? Radius.circular(16) : Radius.zero,
                                topRight: isFirstRow && ci == row.length - 1 ? Radius.circular(16) : Radius.zero,
                                bottomLeft: isLastRow && ci == 0 ? Radius.circular(16) : Radius.zero,
                                bottomRight: isLastRow && ci == row.length - 1 ? Radius.circular(16) : Radius.zero,
                              ),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: '${cell.name}\n',
                                    children: [
                                      TextSpan(
                                        text: '#${cell.bgColor.value.toRadixString(16).substring(2)}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: cell.textColor.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(color: cell.textColor),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  top: 0,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnimatedOpacity(
                                      duration: const Duration(milliseconds: 200),
                                      opacity: isHovered ? 1 : 0,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.copy, color: cell.textColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  void _tryResetCopiedStatus(List<List<_SchemeColorCell>> colors) {
    final rowsLength = colors.length;
    final maxColsLength = colors.map((e) => e.length).reduce(math.max);

    if (_cellsCopiedStatus.length == rowsLength && _cellsCopiedStatus[0] == maxColsLength) {
      return;
    }

    _cellsCopiedStatus = List.generate(
      rowsLength,
          (index) => List.generate(maxColsLength, (_) => false),
    );
  }

}

class _SchemeColorCell {
  _SchemeColorCell({
    this.flex = 1,
    required this.name,
    required this.bgColor,
    required this.textColor,
    this.height = 80.0, // 64.0
  });

  int flex;
  String name;
  Color bgColor;
  Color textColor;
  double height;
}
