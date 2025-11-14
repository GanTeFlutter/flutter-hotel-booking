import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';

class LoginFooterButton extends StatelessWidget {
  const LoginFooterButton({
    required this.onRegisterTap,
    super.key,
  });

  final VoidCallback onRegisterTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.verticalLarge,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Don't have an account? ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
          children: [
            TextSpan(
              text: 'Register',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = onRegisterTap,
            ),
          ],
        ),
      ),
    );
  }
}
