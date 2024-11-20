import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_app/features/location/domain/entities/location_entity.dart'; // Use LocationEntity
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});

  final LocationEntity location; // Change type to LocationEntity

  @override
  Widget build(BuildContext context) {
    // Assuming your LocationModel or LocationEntity has a list of resident URLs
    final List<String> residentsImages =
        location.residents; // Adjust this line accordingly

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
                itemCount: residentsImages.length,
                itemBuilder: (context, index) => Image.network(
                  residentsImages[
                      index], // Assuming the residents list contains image URLs
                  height: 150,
                  width: 300, // or any fixed width for images
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
                  location.name, // Access properties of LocationEntity
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  location.dimension, // Handle null dimensions
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
