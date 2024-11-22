import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_app/features/location/domain/entities/location_entity.dart'; // Use LocationEntity
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});

  final LocationEntity location; // Change type to LocationEntity

  @override
  Widget build(BuildContext context) {
    // Assuming your LocationModel or LocationEntity has a list of resident URLs
    final List<String> residentsImages = [
      "https://static.wikia.nocookie.net/rickandmorty/images/d/d3/Anatomy_Park_7.png/revision/latest/scale-to-width-down/1200?cb=20160913082442",
      "https://platform.vox.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/24415978/rick_and_morty_s4_image.png?quality=90&strip=all&crop=7.8125,0,84.375,100"
    ]; // Adjust this line accordingly

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
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
                    residentsImages[index],
                    height: 150,
                    width: 300,
                    fit: BoxFit.fill,
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
      ),
    );
  }
}
