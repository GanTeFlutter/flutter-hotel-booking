import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class DividerWithText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? dividerColor;
  final double? thickness;
  final double horizontalPadding;
  final double textHorizontalPadding;

  const DividerWithText({
    super.key,
    required this.text,
    this.textColor,
    this.dividerColor,
    this.thickness,
    this.horizontalPadding = 40,
    this.textHorizontalPadding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: dividerColor ?? ColorName.greyscale25,
              thickness: thickness ?? 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: textHorizontalPadding),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor ?? ColorName.greyscale2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: dividerColor ?? ColorName.greyscale25,
              thickness: thickness ?? 2,
            ),
          ),
        ],
      ),
    );
  }
}
