import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_app/data/models/location_model.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});

  final MyLocation location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.blueGreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              location.url == null
                  ? location.residents![0]
                  : "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  location.dimension ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
