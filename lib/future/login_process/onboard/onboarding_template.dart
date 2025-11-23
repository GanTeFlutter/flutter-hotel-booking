import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class OnboardingViewTemplate extends StatelessWidget {
  const OnboardingViewTemplate({
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
    this.showIndicatorSpace = true,
    this.bottomWidget,
    super.key,
  });

  final AssetGenImage backgroundImage;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final bool showIndicatorSpace;
  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: backgroundImage.image(
              fit: BoxFit.cover,
              package: 'gen',
            ),
          ),

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
                  description: description,
                  titleColor: ColorName.greyscale0,
                  descriptionColor: ColorName.greyscale200,
                ),

                if (showIndicatorSpace)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                AppCustomElevatedButton(
                  onPressed: onButtonPressed,
                  text: buttonText,
                  padding: EdgeInsets.only(
                    left: ProjectPadding.large,
                    right: ProjectPadding.large,
                    bottom: showIndicatorSpace ? ProjectPadding.xLarge : 0,
                  ),
                ),

                if (bottomWidget != null) bottomWidget!,

                if (!showIndicatorSpace) const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
