import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class ProfileAvatarRowWidget extends StatelessWidget {
  const ProfileAvatarRowWidget({
    super.key,
    required this.profileUrl,
  });

  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(profileUrl),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oleg Belotserkovsky",
              style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            ),
            Text(
              "Rick",
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.25,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
          ],
        )
      ],
    );
  }
}
