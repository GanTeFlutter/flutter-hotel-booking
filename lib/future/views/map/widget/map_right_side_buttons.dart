import 'package:flutter/material.dart';

final class RightSideButtons extends StatelessWidget {
  const RightSideButtons({
    required this.children,
    super.key,
    this.top = 250,
    this.right = 10,
    this.spacing = 10,
  });

  final List<Widget> children;
  final double top;
  final double right;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Column(
        children:
            children
                .expand((widget) => [widget, SizedBox(height: spacing)])
                .toList()
              ..removeLast(),
      ),
    );
  }
}
