import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class EditButtonWidget extends StatelessWidget {
  final String? buttonText;
  final VoidCallback onPressed;
  final bool isFilled = false;
  final Color? bgColor;
  final Color? textColor;
  const EditButtonWidget(
      {super.key,
      required this.onPressed,
      this.bgColor,
      this.textColor,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: isFilled
              ? WidgetStateProperty.all<Color>(AppColors.darkBgColor)
              : WidgetStateProperty.all<Color>(
                  bgColor ?? AppColors.darkBgColor),
          foregroundColor: isFilled
              ? WidgetStateProperty.all<Color>(AppColors.episodeColor)
              : WidgetStateProperty.all<Color>(
                  textColor ?? AppColors.episodeColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.episodeColor),
            ),
          ),
        ),
        child: Text(
          buttonText ?? "Редактировать",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
