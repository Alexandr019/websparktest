import 'package:flutter/material.dart';
import 'package:websparktest/core/constants/app_colors.dart';
import 'package:websparktest/core/utils/url_validator.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.controller, required this.onChanged, this.error, super.key});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final UrlError? error;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      autocorrect: false,
      enableSuggestions: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'https://flutter.webspark.dev/',
        errorText: switch (error) {
          UrlError.empty => 'Enter a URL',
          UrlError.invalid => 'Enter a valid HTTP or HTTPS URL',
          null => null,
        },
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.gray)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.gray)),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.error)),
        focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.error)),
      ),
    );
  }
}
