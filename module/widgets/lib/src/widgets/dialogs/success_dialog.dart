import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

final class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    required this.title,
    required this.message,
    required this.buttonText,

    super.key,
  });

  final String title;
  final String message;
  final String buttonText;

  static Future<bool> show({
    required String title,
    required String message,
    required String buttonText,
    required BuildContext context,
  }) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) =>
          SuccessDialog(title: title, message: message, buttonText: buttonText),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.lottie.successfulCheckCircle.lottie(
              height: 200,
              width: 200,
              package: 'gen',
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorName.greyscale900,
              ),
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: ColorName.greyscale300),
            ),

            AppCustomElevatedButton(
              text: buttonText,
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      ),
    );
  }
}
