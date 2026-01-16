import 'package:flutter/material.dart';

class ResponsiveSplitView extends StatelessWidget {
  const ResponsiveSplitView({
    super.key,
    required this.left,
    required this.center,
    required this.right,
    required this.showRight,
  });

  final Widget left;
  final Widget center;
  final Widget right;
  final bool showRight;

  @override
  Widget build(BuildContext context) {
    if (!showRight) {
      return Row(
        children: [
          left,
          Expanded(child: center),
        ],
      );
    }

    return Row(
      children: [
        left,
        Expanded(child: center),
        right,
      ],
    );
  }
}
