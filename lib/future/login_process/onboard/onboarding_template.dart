import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/widget/onboard_text.dart';
import 'package:flutter_hotel_booking/future/login_process/widget/register_button.dart';

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

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LaunchText(text: title, isTitle: true),
                const SizedBox(height: 20),
                LaunchText(text: description),
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
                  RegisterButton(
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
