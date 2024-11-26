import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.characterEntity,
  });

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: AppColors.episodeColor,
          backgroundImage: characterEntity.image.isNotEmpty
              ? NetworkImage(characterEntity.image)
              : const AssetImage('assets/images/placeholder.png')
                  as ImageProvider,
        ),
        const SizedBox(height: 18),
        Text(
          characterEntity.status,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: _getStatusColor(characterEntity.status),
          ),
        ),
        Text(
          characterEntity.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              height: 1.2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
        Text(
          '${characterEntity.species}, ${characterEntity.gender}',
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
