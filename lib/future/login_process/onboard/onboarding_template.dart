import 'package:flutter/material.dart';

import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

// Onboarding Template Widget
// Üç farklı onboarding ekranı için ortak şablon
class OnboardingTemplate extends StatelessWidget {
  const OnboardingTemplate({
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.onContinue,
    required this.buttonText,
    this.showPageIndicator = false,
    this.pageIndicator,
    super.key,
  });

  final String buttonText;
  final AssetGenImage backgroundImage;
  final String title;
  final String description;
  final VoidCallback? onContinue;

  final bool showPageIndicator;
  final Widget? pageIndicator;

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
              spacing: ProjectPadding.large,
              children: [
                AppTitleDescriptionText(
                  text: title,
                  titleColor: ColorName.greyscale0,
                  descriptionColor: ColorName.greyscale200,
                  description: description,
                ),
                if (showPageIndicator && pageIndicator != null) ...[
                  pageIndicator!,
                ],
                AppCustomElevatedButton(
                  onPressed: onContinue,
                  text: buttonText,
                  padding: const EdgeInsets.only(
                    left: ProjectPadding.medium,
                    right: ProjectPadding.medium,
                    top: ProjectPadding.medium,
                    bottom: ProjectPadding.xLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
