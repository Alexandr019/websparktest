import 'package:flutter/material.dart';
import 'package:websparktest/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.title, required this.onPressed, this.isLoading = false, super.key});

  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.buttonBackground.withValues(alpha: 0.5),
          padding: const EdgeInsets.all(16),
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.buttonBorder),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.black),
              )
            : Text(title, style: const TextStyle(color: AppColors.black)),
      ),
    );
  }
}
