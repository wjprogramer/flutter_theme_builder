import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/models/models.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:flutter_theme_builder/utils/material/color.dart';
import 'package:flutter_theme_builder/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

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
  late TextTheme _textTheme;
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
  var _lockOtherCoreColors = false;
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
  var _coreTonalPalettesBarsVisible = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_timeStamp) {
      _onThemeChanged(_themeProvider.themeData);

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
    print('_onThemeChanged ${_themeProvider.themeType}');
    _themeData = theme;
    _colorScheme = _themeData.colorScheme;

    if (_cellsCopiedStatus.isEmpty) {
      _tryResetCopiedStatus(_generateColorCells(_colorScheme));
    }
  }

  List<List<_SchemeColorCell>> _generateColorCells(ColorScheme colorScheme) {
    return <List<_SchemeColorCell>>[
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Primary',
          bgColor: colorScheme.primary,
          textColor: colorScheme.onPrimary,
          height: 118,
        ),
        _SchemeColorCell(
          name: 'On Primary',
          bgColor: colorScheme.onPrimary,
          textColor: colorScheme.primary,
          height: 118,
        ),
        _SchemeColorCell(
          name: 'Primary Container',
          bgColor: colorScheme.primaryContainer,
          textColor: colorScheme.onPrimaryContainer,
          height: 118,
        ),
        _SchemeColorCell(
          name: 'On Primary Container',
          bgColor: colorScheme.onPrimaryContainer,
          textColor: colorScheme.primaryContainer,
          height: 118,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Secondary',
          bgColor: colorScheme.secondary,
          textColor: colorScheme.onSecondary,
        ),
        _SchemeColorCell(
          name: 'On Secondary',
          bgColor: colorScheme.onSecondary,
          textColor: colorScheme.secondary,
        ),
        _SchemeColorCell(
          name: 'Secondary Container',
          bgColor: colorScheme.secondaryContainer,
          textColor: colorScheme.onSecondaryContainer,
        ),
        _SchemeColorCell(
          name: 'On Secondary Container',
          bgColor: colorScheme.onSecondaryContainer,
          textColor: colorScheme.secondaryContainer,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Tertiary',
          bgColor: colorScheme.tertiary,
          textColor: colorScheme.onTertiary,
        ),
        _SchemeColorCell(
          name: 'On Tertiary',
          bgColor: colorScheme.onTertiary,
          textColor: colorScheme.tertiary,
        ),
        _SchemeColorCell(
          name: 'Tertiary Container',
          bgColor: colorScheme.tertiaryContainer,
          textColor: colorScheme.onTertiaryContainer,
        ),
        _SchemeColorCell(
          name: 'On Tertiary Container',
          bgColor: colorScheme.onTertiaryContainer,
          textColor: colorScheme.tertiaryContainer,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Error',
          bgColor: colorScheme.error,
          textColor: colorScheme.onError,
        ),
        _SchemeColorCell(
          name: 'On Error',
          bgColor: colorScheme.onError,
          textColor: colorScheme.error,
        ),
        _SchemeColorCell(
          name: 'Error Container',
          bgColor: colorScheme.errorContainer,
          textColor: colorScheme.onErrorContainer,
        ),
        _SchemeColorCell(
          name: 'On Error Container',
          bgColor: colorScheme.onErrorContainer,
          textColor: colorScheme.errorContainer,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Background',
          bgColor: colorScheme.background,
          textColor: colorScheme.onBackground,
        ),
        _SchemeColorCell(
          name: 'On Background',
          bgColor: colorScheme.onBackground,
          textColor: colorScheme.background,
        ),
        _SchemeColorCell(
          name: 'Surface',
          bgColor: colorScheme.surface,
          textColor: colorScheme.onSurface,
        ),
        _SchemeColorCell(
          name: 'On Surface',
          bgColor: colorScheme.onSurface,
          textColor: colorScheme.surface,
        ),
      ],
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Outline',
          bgColor: colorScheme.outline,
          textColor: colorScheme.background,
          flex: 2,
        ),
        _SchemeColorCell(
          name: 'Surface Variant',
          bgColor: colorScheme.surfaceVariant,
          textColor: colorScheme.onSurfaceVariant,
        ),
        _SchemeColorCell(
          name: 'On Surface Variant',
          bgColor: colorScheme.onSurfaceVariant,
          textColor: colorScheme.surfaceVariant,
        ),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return Consumer<ThemeProvider>(
          builder: (_, themeProvider, ___) {
            _themeProvider = themeProvider;
            _textTheme = Theme.of(context).textTheme;

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
                  Expanded(child: _buildLeft(trailingSpace: true)),
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

  Widget _buildLeft({
    required bool trailingSpace,
  }) {
    return SelectionArea(
      focusNode: _leftFocusNode,
      child: ListView(
        children: [
          ..._buildLeftItems(),
          if (trailingSpace)
            120.height,
        ],
      ),
    );
  }

  List<Widget> _buildLeftItems() {
    return [
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
          style: _descriptionStyle,
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
                  style: _textTheme.bodySmall,
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
                  _pickColor(
                    color: e.color,
                    onColorSelected: (cc) {
                      setState(() {
                        e.color = cc;
                        _updateThemeByCoreColor();
                      });
                    },
                  );
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
                  _updateThemeByCoreColor();
                });
              },
              icon: Icon(Icons.delete),
            ),
            Checkbox(
              value: e.harmonized,
              onChanged: (v) {
                setState(() {
                  e.harmonized = v ?? e.harmonized;
                  _updateThemeByCoreColor();
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
                  _myCustomColors.add(_MyCustomColor(
                    name: 'Hello',
                    harmonized: true,
                    color: hexFromArgb(Colors.blue.value),
                  ));
                  _updateThemeByCoreColor();
                });
              },
              style: IconButton.styleFrom(
                backgroundColor: _themeData.colorScheme.surfaceVariant,
              ),
              icon: Icon(Icons.add),
            ),
            16.width,
            Text(
              'Add a color',
              style: _textTheme.bodyLarge,
            ),
          ],
        ),
      ].map((e) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: e,
      )),
      20.height,
    ];
  }

  TextStyle? get _descriptionStyle => _textTheme.bodyLarge?.copyWith(
    color: _themeData.colorScheme.onSurface.withOpacity(.67),
  );

  void _updateThemeByCoreColor() {
    _themeProvider.setThemes(
      primaryColor: _primaryColor,
      secondaryColor: _lockOtherCoreColors ? null : _secondaryColor,
      tertiaryColor: _lockOtherCoreColors ? null : _tertiaryColor,
      neutralColor: _lockOtherCoreColors ? null : _neutralColor,
      customColors: _myCustomColors.map((e) => e.value).toList(),
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
              child: ColorCircleLabel(
                color: color,
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
              Stack(
                children: [
                  Padding(
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
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Text(
                      'Lock',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
    Color resultColor = color;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          content: SingleChildScrollView(
            child: SlidePicker(
              pickerColor: _INSTANT_APPLY_CORE_COLOR_CHANGES ? resultColor : color,
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
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 44),
      children: [
        ..._buildRightListItems(),
        120.height,
      ],
    );
  }

  Widget _buildMain() {
    final items = [
      32.height,
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
    final customColorsResults = _themeProvider.customThemes.customColors;

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
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 16,
        children: buildDemoWidgetsListItems(),
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
      if (_coreTonalPalettesBarsVisible) ...[
        _buildTonalPaletteTonesBar('Primary', _themeProvider.customThemes.palettes.primary),
        _buildTonalPaletteTonesBar('Secondary', _themeProvider.customThemes.palettes.secondary),
        _buildTonalPaletteTonesBar('Tertiary', _themeProvider.customThemes.palettes.tertiary),
        _buildTonalPaletteTonesBar('Error', _themeProvider.customThemes.palettes.error),
        _buildTonalPaletteTonesBar('Neutral', _themeProvider.customThemes.palettes.neutral),
        _buildTonalPaletteTonesBar('Neutral Variant', _themeProvider.customThemes.palettes.neutralVariant),
      ],
      20.height,
      ...[
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              setState(() {
                _coreTonalPalettesBarsVisible = !_coreTonalPalettesBarsVisible;
              });
            },
            child: Text(
              '${_coreTonalPalettesBarsVisible ? 'Hide' : 'Show'} tonal palettes',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
      if (customColorsResults.isNotEmpty) ...[
        ...customColorsResults.mapIndexed((e, i) => <Widget>[
          20.height,
          ...buildCustomColorListItems(
            _themeData,
            e,
            i <= _myCustomColors.length - 1 ? _myCustomColors[i].name : null,
          ),
        ]).expand((element) => element),
      ],

    ];
  }

  Widget _buildTonalPaletteTonesBar(String text, colorUtilities.TonalPalette palette) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          text,
          style: _textTheme.titleSmall,
        ),
        8.height,
        TonalPaletteTonesBar(
          tonalPalette: palette,
        ),
        20.height,
      ],
    );
  }

  Widget _buildScheme(ThemeData theme) {
    final colorRows = _generateColorCells(theme.colorScheme);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${theme.brightness == Brightness.light ? 'Light' : 'Dark'} Scheme',
            textAlign: TextAlign.start,
          ),
          16.height,
          ...colorRows.mapIndexed((row, ri) {
            final isLastRow = ri == (colorRows.length - 1);
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
                                        onPressed: () async {
                                          if (_cellsCopiedStatus[ri][ci]) {
                                            return;
                                          }

                                          await Clipboard.setData(ClipboardData(text: hexFromArgb(cell.bgColor.value)));
                                          setState(() {
                                            _cellsCopiedStatus[ri][ci] = true;
                                          });

                                          await Future.delayed(const Duration(milliseconds: 800));
                                          if (mounted) {
                                            setState(() {
                                              _cellsCopiedStatus[ri][ci] = false;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          _cellsCopiedStatus[ri][ci] ? Icons.check : Icons.copy,
                                          color: cell.textColor,
                                        ),
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
