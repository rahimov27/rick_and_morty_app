import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/character_model.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.characters});

  final MyCharacters characters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(characters.image ?? ''),
        ),
        const SizedBox(height: 18),
        Text(
          characters.status ?? "",
          style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.green),
        ),
        Text(
          characters.name ?? "",
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
        Text(
          '${characters.species},${characters.gender}',
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey),
        ),
      ],
    );
  }
}
