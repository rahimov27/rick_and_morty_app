import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class ProfileSubTitleWidget extends StatelessWidget {
  final String? text;
  const ProfileSubTitleWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text?.toUpperCase() ?? "",
      style: const TextStyle(
          fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.grey),
    );
  }
}
