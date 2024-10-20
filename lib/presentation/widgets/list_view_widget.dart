import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/character_model.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget(
      {super.key, required this.characters, required this.onTap});

  final MyCharacters characters;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 37,
              backgroundImage: NetworkImage(characters.image ?? ''),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  characters.status ?? "",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: characters.status == "Alive"
                        ? AppColors.green
                        : characters.status == "unknown"
                            ? AppColors.grey
                            : AppColors.red,
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
                  '${characters.species},${characters.gender}',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
