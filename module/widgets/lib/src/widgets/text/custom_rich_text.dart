import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class CustomRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final FontWeight? fontWeight1;
  final FontWeight? fontWeight2;
  final Color? color1;
  final Color? color2;
  final VoidCallback? onTap;

  const CustomRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.fontWeight1,
    this.fontWeight2,
    this.color1,
    this.color2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color1 ?? ColorName.greyscale2,
                fontWeight: fontWeight1 ?? FontWeight.w900,
              ),
            ),
            TextSpan(
              text: text2,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color2 ?? ColorName.primary800,
                fontWeight: fontWeight2 ?? FontWeight.w900,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
