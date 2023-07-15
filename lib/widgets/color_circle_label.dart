import 'package:flutter/material.dart';

class ColorCircleLabel extends StatelessWidget {
  const ColorCircleLabel({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const SIZE = 48.0;
    const BORDER_WIDTH = 3.0;

    return SizedBox(
      width: SIZE,
      height: SIZE,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            height: SIZE,
            width: SIZE,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // TODO: 顏色不確定
              color: theme.cardColor,
            ),
          ),
          Center(
            child: Container(
              height: SIZE - 2 * BORDER_WIDTH,
              width: SIZE - 2 * BORDER_WIDTH,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
