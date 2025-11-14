import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/launch/widget/step_3text.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/widget/app_elevated_custom_button.dart';
import 'package:gen/gen.dart';

// Onboarding Template Widget
// Üç farklı onboarding ekranı için ortak şablon
class OnboardingTemplate extends StatelessWidget {
  const OnboardingTemplate({
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.onContinue,
    this.registerButton = false,
    this.onRegister,
    this.buttonText = 'Continue',
    super.key,
  });

  final String? buttonText;
  final bool registerButton;
  final AssetGenImage backgroundImage;
  final String title;
  final String description;
  final VoidCallback onContinue;
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

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OnboardingText(text: title, isTitle: true),
                const SizedBox(height: 20),
                OnboardingText(text: description),
                Text(
                  description,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorName.greyscale200,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppCustomElevatedButton(
                  padding: const EdgeInsets.only(
                    top: ProjectPadding.xLarge,
                    left: ProjectPadding.large,
                    right: ProjectPadding.large,
                    bottom: ProjectPadding.large,
                  ),
                  onPressed: onContinue,
                  text: buttonText,
                  height: 70,
                ),
                if (registerButton)
                  LoginFooterButton(
                    onRegisterTap: () {},
                  ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingText extends StatelessWidget {
  const OnboardingText({
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
