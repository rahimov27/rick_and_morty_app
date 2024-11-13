import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class AboutAppTextWidget extends StatelessWidget {
  const AboutAppTextWidget({
    super.key,
    required this.aboutText,
  });

  final String aboutText;

  @override
  Widget build(BuildContext context) {
    return Text(
      aboutText,
      style: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.white),
    );
  }
}
