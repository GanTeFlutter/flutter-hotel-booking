import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:gen/gen.dart';

final class AppCustomElevatedButton extends StatelessWidget {
  const AppCustomElevatedButton({
    required this.onPressed,
    required this.text,
    this.width,
    this.height = 56,
    this.padding,
    super.key,
  });

  final VoidCallback? onPressed;
  final String? text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? ProjectPadding.verticalLarge,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text ?? AppStrings.onBoardingButtonContinue,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ColorName.secondary50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
