import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class LaunchText extends StatelessWidget {
  const LaunchText({
    required this.text,
    this.isTitle = false,
    super.key,
  });

  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: isTitle
          ? Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.33,
              color: ColorName.greyscale0,
            )
          : Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorName.greyscale200,
            ),
    );
  }
}
