import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';

class EpisodeTitleWidget extends StatelessWidget {
  const EpisodeTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            "Эпизоды",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
          ),
          Spacer(),
          Text(
            "Все эпизоды",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
