import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.characterEntity,
    required this.onTap,
  });

  final CharacterEntity characterEntity;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            // CircleAvatar(
            //   radius: 37,
            //   backgroundImage:
            //       characterEntity.image != null && characterEntity.image!.isNotEmpty
            //           ? NetworkImage(characterEntity.image!)
            //           : const AssetImage('assets/images/placeholder.png')
            //               as ImageProvider,
            // ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  characterEntity.status ?? "",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: _getStatusColor(characterEntity.status),
                  ),
                ),
                Text(
                  characterEntity.name ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
                Text(
                  '${characterEntity.species}, ${characterEntity.gender}',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
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
