import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class ChangeCeoRowWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const ChangeCeoRowWidget(
      {super.key,
      required this.subtitle,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
