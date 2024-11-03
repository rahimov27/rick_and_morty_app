import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.characters,
  });

  final CharacterModel characters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: characters.image != null && characters.image!.isNotEmpty
              ? NetworkImage(characters.image!)
              : const AssetImage('assets/images/placeholder.png') as ImageProvider,
        ),
        const SizedBox(height: 18),
        Text(
          characters.status ?? "",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: _getStatusColor(characters.status),
          ),
        ),
        Text(
          characters.name ?? "",
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
        Text(
          '${characters.species}, ${characters.gender}',
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey),
        ),
      ],
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "Alive":
        return AppColors.green;
      case "Dead":
        return AppColors.red;
      default:
        return AppColors.grey;
    }
  }
}
