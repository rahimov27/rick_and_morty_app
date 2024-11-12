import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class EpisodeRowWidget extends StatelessWidget {
  final String? episode;
  final String? title;
  final String? date;

  const EpisodeRowWidget(
      {super.key,
      required this.date,
      required this.episode,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                "https://m.media-amazon.com/images/S/pv-target-images/3f8ae4a13de932bc679af5272ce983693d773818ff67a774dfcf0592bcd3beb7._SX1080_FMjpg_.jpg"),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                episode ?? "",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.episodeColor,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  title ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
              Text(
                date ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
