import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/providers/theme_change_provider.dart';
import 'package:flutter_theme_builder/utilities/theme_temp_utility.dart';
import 'package:flutter_theme_builder/utils/test/test.dart';
import 'package:flutter_theme_builder/widgets/demo_mobile_1.dart';
import 'package:provider/provider.dart';

typedef _ColorSelected = Function(Color color);

class CustomThemeFragment extends StatefulWidget {
  const CustomThemeFragment({Key? key}) : super(key: key);

  @override
  State<CustomThemeFragment> createState() => _CustomThemeFragmentState();
}

class _CustomThemeFragmentState extends State<CustomThemeFragment> {
  late ThemeProvider _themeProvider;
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;

  Color _primaryColor = Colors.white;

  Color? __secondaryColor = Colors.white;
  Color get _secondaryColor => __secondaryColor!;

  Color? __tertiaryColor = Colors.white;
  Color get _tertiaryColor => __tertiaryColor!;

  Color? __neutralColor = Colors.white;
  Color get _neutralColor => __neutralColor!;

  final _leftFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_timeStamp) {
      final themeProvider = context.read<ThemeProvider>();
      _primaryColor = themeProvider.themeData.colorScheme.primary;
      __secondaryColor = themeProvider.themeData.colorScheme.secondary;
      __tertiaryColor = themeProvider.themeData.colorScheme.tertiary;
      __neutralColor = themeProvider.themeData.colorScheme.surface;

      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return Consumer<ThemeProvider>(
          builder: (_, themeProvider, ___) {
            _themeProvider = themeProvider;

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
      secondaryColor: _secondaryColor,
      tertiaryColor: _tertiaryColor,
      neutralColor: _neutralColor,
    );
  }

  Widget _coreColorCard({
    required String title,
    String? subtitle,
    required Color color,
    required _ColorSelected onColorSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _themeData.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: subtitle != null
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _pickColor(
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
            ],
          ),
        ),
        Text(
          '#' + color.value.toRadixString(16),
        ),
      ],
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
              pickerColor: _primaryColor,
              onColorChanged: (v) {
                resultColor = v;
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

  Widget _buildScheme(ThemeData themeView) {
    final colorScheme = themeView.colorScheme;

    final _colorRows = <List<_SchemeColorCell>>[
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${themeView.brightness == Brightness.light ? 'Light' : 'Dark'} Scheme',
            textAlign: TextAlign.start,
          ),
          16.height,
          ..._colorRows.mapIndexed((row, i) {
            final isLastRow = i == (_colorRows.length - 1);
            final isFirstRow = i == 0;

            return Padding(
              padding: isLastRow
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  ...row.mapIndexed((e, i) => Expanded(
                    flex: e.flex,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      height: e.height,
                      decoration: BoxDecoration(
                        color: e.bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: isFirstRow && i == 0 ? Radius.circular(16) : Radius.zero,
                          topRight: isFirstRow && i == row.length - 1 ? Radius.circular(16) : Radius.zero,
                          bottomLeft: isLastRow && i == 0 ? Radius.circular(16) : Radius.zero,
                          bottomRight: isLastRow && i == row.length - 1 ? Radius.circular(16) : Radius.zero,
                        ),
                      ),
                      child: Text.rich(
                          TextSpan(
                            text: '${e.name}\n',
                            children: [
                              TextSpan(
                                text: '#${e.bgColor.value.toRadixString(16).substring(2)}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: e.textColor.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(color: e.textColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
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
