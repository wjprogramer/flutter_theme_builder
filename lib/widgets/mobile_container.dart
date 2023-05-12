import 'package:flutter/material.dart';
import 'package:flutter_theme_builder/themes/colors.dart';

class MobileContainer extends StatelessWidget {
  const MobileContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderColor = theme.brightness == Brightness.light
        ? lightSysOutlineColor
        : darkSysOutlineColor;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 8,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(14.87),
      ),
      constraints: BoxConstraints(
        maxWidth: 428,
        maxHeight: 908,
      ),
      child: AspectRatio(
        aspectRatio: 428 / 908,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.87),
          child: child,
        ),
      ),
    );
  }
}
