import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class MultiSocialLoginButton extends StatelessWidget {
  const MultiSocialLoginButton({
    super.key,
    required this.width,
    required this.onGoogleTap,
    required this.onFacebookTap,
    required this.onAppleTap,
  });

  final double width;
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24,
      children: [
        SocialLoginButton(
          onTap: onGoogleTap,
          width: width * 0.17,
          imageWidget: Assets.image.smbGoogle.image(
            fit: BoxFit.contain,
            package: 'gen',
          ),
        ),
        SocialLoginButton(
          onTap: onFacebookTap,
          width: width * 0.17,
          imageWidget: Assets.image.smbFacebook.image(
            fit: BoxFit.contain,
            package: 'gen',
          ),
        ),
        SocialLoginButton(
          onTap: onAppleTap,
          width: width * 0.17,
          imageWidget: Assets.image.smbApple.image(
            fit: BoxFit.contain,
            package: 'gen',
          ),
        ),
      ],
    );
  }
}

final class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Widget imageWidget;

  const SocialLoginButton({
    super.key,
    required this.onTap,
    this.width = 60,
    this.height = 60,
    this.backgroundColor,
    required this.imageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorName.greyscale25,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(padding: const EdgeInsets.all(12), child: imageWidget),
      ),
    );
  }
}


/*
   Assets.image.taslar.image(
              height: 200,
              width: 200,
              package: 'gen',
            ),

*/