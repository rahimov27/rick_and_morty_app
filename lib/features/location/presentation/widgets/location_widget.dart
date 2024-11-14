import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});

  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    final List<String> locationsImages = [
      "https://static.wikia.nocookie.net/rickandmorty/images/d/d3/Anatomy_Park_7.png/revision/latest/scale-to-width-down/1200?cb=20160913082442",
      "https://static.wikia.nocookie.net/rickandmorty/images/1/11/Meta_reality.jpg/revision/latest?cb=20230219144844",
      "https://static.wikia.nocookie.net/rickandmorty/images/a/a0/TamorusLite.png/revision/latest/scale-to-width-down/1200?cb=20221210222821"
    ];
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
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locationsImages.length,
                itemBuilder: (context, index) => Image.network(
                  locationsImages[index],
                  height: 150,
                  width: 300, // или любая фиксированная ширина для изображений
                  fit: BoxFit.cover,
                ),
              ),
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
