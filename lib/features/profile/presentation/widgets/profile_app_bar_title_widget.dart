import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class ProfileAppBarTitleWidget extends StatelessWidget {
  final String text;
  const ProfileAppBarTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.white),
    );
  }
}
