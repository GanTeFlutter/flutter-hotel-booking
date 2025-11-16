import 'package:flutter/material.dart';

final class AppTitleDescriptionText extends StatelessWidget {
  const AppTitleDescriptionText({
    required this.text,
    required this.description,
    required this.titleColor,
    required this.descriptionColor,
    super.key,
  });

  final String text;
  final String description;
  final Color titleColor;
  final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 24,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: descriptionColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
