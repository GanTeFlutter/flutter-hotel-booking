import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class OnBoardinEndView extends StatelessWidget {
  const OnBoardinEndView({
    required this.backgroundImage,
    required this.buttonText,
    required this.title,
    required this.description,
    required this.onContinue,
    required this.onRegister,
    super.key,
  });

  final AssetGenImage backgroundImage;
  final String buttonText;
  final String title;
  final String description;
  final VoidCallback? onContinue;
  final VoidCallback? onRegister;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              backgroundImage.path,
              fit: BoxFit.cover,
              package: 'gen',
            ),
          ),

          // Background Gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF110C1D).withValues(alpha: 0),
                    const Color(0xFF110C1D),
                  ],
                  stops: const [0.0, 0.76],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 30,
              children: [
                AppTitleDescriptionText(
                  text: title,
                  titleColor: ColorName.greyscale0,
                  descriptionColor: ColorName.greyscale200,
                  description: description,
                ),

                AppCustomElevatedButton(
                  onPressed: onContinue,
                  text: buttonText,
                  padding: const EdgeInsets.only(
                    left: ProjectPadding.medium,
                    right: ProjectPadding.medium,
                    top: ProjectPadding.medium,
                    bottom: ProjectPadding.small,
                  ),
                ),

                CustomRichText(
                  text1: AppStrings.noAccount1,
                  text2: AppStrings.noAccount2,
                  fontWeight1: FontWeight.w400,
                  fontWeight2: FontWeight.w600,
                  color1: ColorName.greyscale0,
                  color2: ColorName.primary800,
                  onTap: () => onRegister!(),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
