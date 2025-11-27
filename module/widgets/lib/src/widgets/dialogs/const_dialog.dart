// lib/product/service/notification/app_dialogs.dart
import 'package:flutter/material.dart';

import 'package:widgets/widgets.dart';

@immutable
final class AppDialogs {
  const AppDialogs._();

  /// Terms of Service dialog
  static Future<bool?> showTermsDialog({
    required BuildContext context,
    required VoidCallback onAgree,
  }) {
    return DialogHelper.showCustomDialog(
      context: context,
      title: 'Terms of Service',
      description:
          'I agree to the Terms of Service and Conditions of Use including consent to electronic communications and I affirm that the information provided is my own.',
      primaryButtonText: 'Agree',
      secondaryButtonText: 'Disagree',
      primaryButtonColor: Colors.blue,
      secondaryButtonColor: Colors.red,
      onPrimaryPressed: onAgree,
      onSecondaryPressed: () {},
    );
  }

  /// Delete account confirmation dialog
  static Future<bool?> showDeleteAccountDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    return DialogHelper.showCustomDialog(
      context: context,
      title: 'Delete Account',
      description:
          'Are you sure you want to delete your account? This action cannot be undone.',
      primaryButtonText: 'Delete',
      secondaryButtonText: 'Cancel',
      primaryButtonColor: Colors.red,
      secondaryButtonColor: Colors.grey,
      icon: Icons.warning_amber_rounded,
      iconColor: Colors.red,
      onPrimaryPressed: onConfirm,
      onSecondaryPressed: () {},
    );
  }

  /// Logout confirmation dialog
  static Future<bool?> showLogoutDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    return DialogHelper.showCustomDialog(
      context: context,
      title: 'Logout',
      description: 'Are you sure you want to logout?',
      primaryButtonText: 'Logout',
      secondaryButtonText: 'Cancel',
      primaryButtonColor: Colors.orange,
      secondaryButtonColor: Colors.grey,
      icon: Icons.logout_rounded,
      iconColor: Colors.orange,
      onPrimaryPressed: onConfirm,
      onSecondaryPressed: () {},
    );
  }

  /// Success dialog
  static Future<bool?> showSuccessDialog({
    required BuildContext context,
    required String title,
    required String description,
    VoidCallback? onOk,
  }) {
    return DialogHelper.showCustomDialog(
      context: context,
      title: title,
      description: description,
      primaryButtonText: 'OK',
      primaryButtonColor: Colors.green,
      icon: Icons.check_circle_outline,
      iconColor: Colors.green,
      onPrimaryPressed: onOk ?? () {},
    );
  }

  /// Error dialog
  static Future<bool?> showErrorDialog({
    required BuildContext context,
    required String title,
    required String description,
    VoidCallback? onRetry,
  }) {
    return DialogHelper.showCustomDialog(
      context: context,
      title: title,
      description: description,
      primaryButtonText: 'Retry',
      secondaryButtonText: 'Cancel',
      primaryButtonColor: Colors.red,
      secondaryButtonColor: Colors.grey,
      icon: Icons.error_outline,
      iconColor: Colors.red,
      onPrimaryPressed: onRetry ?? () {},
      onSecondaryPressed: () {},
    );
  }

  /// Mandatory update dialog (cannot be dismissed)
  static Future<bool?> showForeUpdateDialog({
    required BuildContext context,
    required VoidCallback onUpdate,
  }) {
    return DialogHelper.showCustomDialog(
      context: context,
      title: 'Update Required',
      description:
          'A new version is required to continue using the app. Please update now to continue.',
      primaryButtonText: 'Update Now',
      primaryButtonColor: Colors.red.shade700,
      icon: Icons.system_update_alt,
      iconColor: Colors.red.shade700,
      barrierDismissible: false,
      onPrimaryPressed: onUpdate,
    );
  }

  /// Optional update dialog (can be dismissed)
  static Future<bool?> showOptionalUpdateDialog({
    required BuildContext context,
    required VoidCallback onUpdate,
    required VoidCallback onLater,
  }) {
    return DialogHelper.showCustomDialog(
      context: context,
      title: 'Update Available',
      description:
          'A new version is available with improvements and bug fixes. Would you like to update now?',
      primaryButtonText: 'Update',
      secondaryButtonText: 'Later',
      primaryButtonColor: Colors.indigo,
      icon: Icons.system_update,
      iconColor: Colors.indigo,
      onPrimaryPressed: onUpdate,
      onSecondaryPressed: onLater,
    );
  }
}
