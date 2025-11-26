import 'package:flutter/material.dart';

@immutable
final class DialogHelper {
  const DialogHelper._();

  static Future<bool?> showCustomDialog({
    required BuildContext context,
    required String title,
    required String description,
    required String primaryButtonText,
    String? secondaryButtonText, 
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    Color? primaryButtonColor,
    Color? secondaryButtonColor,
    IconData? icon,
    Color? iconColor,
    bool barrierDismissible = true,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (dialogContext) => _CustomDialog(
        title: title,
        description: description,
        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText,
        onPrimaryPressed: onPrimaryPressed,
        onSecondaryPressed: onSecondaryPressed,
        primaryButtonColor: primaryButtonColor,
        secondaryButtonColor: secondaryButtonColor,
        icon: icon,
        iconColor: iconColor,
      ),
    );
  }
}

final class _CustomDialog extends StatelessWidget {
  const _CustomDialog({
    required this.title,
    required this.description,
    required this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.icon,
    this.iconColor,
  });

  final String title;
  final String description;
  final String primaryButtonText;
  final String? secondaryButtonText; 
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final Color? primaryButtonColor;
  final Color? secondaryButtonColor;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      elevation: 8,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(context),
              _buildTitle(isDark),
              const SizedBox(height: 16),
              _buildDescription(isDark),
              const SizedBox(height: 28),
              _buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    if (icon == null) return const SizedBox.shrink();

    final effectiveIconColor = iconColor ?? Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: effectiveIconColor.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: effectiveIconColor.withValues(alpha: 0.2),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(icon, size: 48, color: effectiveIconColor),
      ),
    );
  }

  Widget _buildTitle(bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        height: 1.2,
        color: isDark ? Colors.white : Colors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription(bool isDark) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 15,
        color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
        height: 1.5,
        letterSpacing: 0.1,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButtons(BuildContext context) {
    
    if (secondaryButtonText == null) {
      return SizedBox(
        width: double.infinity,
        child: _buildPrimaryButton(context),
      );
    }

    
    return Row(
      children: [
        Expanded(child: _buildSecondaryButton(context)),
        const SizedBox(width: 12),
        Expanded(child: _buildPrimaryButton(context)),
      ],
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveColor =
        secondaryButtonColor ??
        (isDark ? Colors.grey.shade600 : Colors.grey.shade400);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  Colors.white.withValues(alpha: 0.1),
                  Colors.white.withValues(alpha: 0.05),
                ]
              : [Colors.grey.shade100, Colors.grey.shade50],
        ),
      ),
      child: OutlinedButton(
        onPressed: () {
          onSecondaryPressed?.call();
          Navigator.of(context, rootNavigator: true).pop(false);
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: effectiveColor.withValues(alpha: 0.3),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          secondaryButtonText!,
          style: TextStyle(
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    final effectiveColor = primaryButtonColor ?? Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [effectiveColor, effectiveColor.withValues(alpha: 0.85)],
        ),
        boxShadow: [
          BoxShadow(
            color: effectiveColor.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          onPrimaryPressed?.call();
          Navigator.of(context, rootNavigator: true).pop(true);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          primaryButtonText,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
