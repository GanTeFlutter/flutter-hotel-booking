import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double size;

  const AppProgressIndicator({super.key, this.strokeWidth = 6, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 6,
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
        backgroundColor: Color(0xFFBBDEFB),
      ),
    );
  }
}
