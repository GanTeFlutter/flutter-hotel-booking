import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class RememberMeForgotPassword extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;
  final VoidCallback onForgotPasswordTap;
  final String rememberMeText;
  final String forgotPasswordText;
  final Color? textColor;
  final Color? linkColor;

  const RememberMeForgotPassword({
    super.key,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onForgotPasswordTap,
    required this.rememberMeText,
    required this.forgotPasswordText,
    this.textColor,
    this.linkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: onRememberMeChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              shape: const CircleBorder(),
            ),
            Text(
              rememberMeText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor ?? ColorName.greyscale2,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onForgotPasswordTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            forgotPasswordText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: linkColor ?? ColorName.error1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
