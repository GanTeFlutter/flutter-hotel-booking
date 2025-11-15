import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class AppCustomElevatedButton extends StatelessWidget {
  const AppCustomElevatedButton({
    required this.onPressed,
    required this.text,
    this.height = 56,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 12,
    this.width,
    this.expand = true,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double height;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: expand ? double.infinity : width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.primary800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorName.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
