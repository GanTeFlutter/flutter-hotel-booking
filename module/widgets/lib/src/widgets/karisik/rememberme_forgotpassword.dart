import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class RememberMeForgotPassword extends StatefulWidget {
  final bool initialRememberMe;
  final ValueChanged<bool> onRememberMeChanged;
  final VoidCallback onForgotPasswordTap;
  final String rememberMeText;
  final String forgotPasswordText;
  final Color? textColor;
  final Color? linkColor;

  const RememberMeForgotPassword({
    super.key,
    this.initialRememberMe = false,
    required this.onRememberMeChanged,
    required this.onForgotPasswordTap,
    required this.rememberMeText,
    required this.forgotPasswordText,
    this.textColor,
    this.linkColor,
  });

  @override
  State<RememberMeForgotPassword> createState() =>
      _RememberMeForgotPasswordState();
}

class _RememberMeForgotPasswordState extends State<RememberMeForgotPassword> {
  late bool _rememberMe;

  @override
  void initState() {
    super.initState();
    _rememberMe = widget.initialRememberMe;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
                widget.onRememberMeChanged(_rememberMe);
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              shape: const CircleBorder(),
              side: BorderSide(
                color: _rememberMe
                    ? ColorName.greyscale100
                    : ColorName.greyscale50,
                width: 2,
              ),

              activeColor: ColorName.greyscale100,

              checkColor: Colors.white,

              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorName.greyscale100;
                }
                return Colors.transparent;
              }),
            ),
            Text(
              widget.rememberMeText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: widget.textColor ?? ColorName.greyscale2,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: widget.onForgotPasswordTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            widget.forgotPasswordText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: widget.linkColor ?? ColorName.error1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
