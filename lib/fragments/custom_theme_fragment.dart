import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';

class CustomThemeFragment extends StatefulWidget {
  const CustomThemeFragment({Key? key}) : super(key: key);

  @override
  State<CustomThemeFragment> createState() => _CustomThemeFragmentState();
}

class _CustomThemeFragmentState extends State<CustomThemeFragment> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        // >= 935: 2 column
        if (maxWidth > 935) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildLeft(),
              ),
              VerticalDivider(width: 1),
              Expanded(
                flex: 2,
                child: _buildRight(),
              ),
            ],
          );
        }

        return _buildMain();
      },
    );
  }

  Widget _buildLeft() {
    return Container();
  }

  Widget _buildRight() {
    return ListView(
      children: [
        ..._buildRightListItems(),
      ],
    );
  }

  Widget _buildMain() {
    return Container();
  }

  List<Widget> _buildRightListItems() {
    final tmpTheme = Theme.of(context);

    return [
      _buildScheme(tmpTheme),
    ];
  }

  Widget _buildScheme(ThemeData themeView) {
    final colorScheme = themeView.colorScheme;

    final _colorRows = <List<_SchemeColorCell>>[
      <_SchemeColorCell>[
        _SchemeColorCell(
          name: 'Primary',
          bgColor: colorScheme.primary,
          textColor: colorScheme.onPrimaryContainer,
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
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        children: [
          ..._colorRows.mapIndexed((row, i) {
            final isLastRow = i == (_colorRows.length - 1);
            final isFirstRow = i == 0;

            return Padding(
              padding: isLastRow
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  ...row.map((e) => Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      height: e.height,
                      color: e.bgColor,
                      child: Text(
                        e.name,
                        style: TextStyle(color: e.textColor),
                      ),
                    ),
                  )),
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
    this.height = 64.0,
  });

  int flex;
  String name;
  Color bgColor;
  Color textColor;
  double height;
}
