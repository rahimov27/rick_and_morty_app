import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/chararcter/data/models/character_model.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';
import 'package:rick_and_morty_app/features/episode/presentation/widgets/episode_title_widget.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({
    super.key,
    this.characterModel,
    this.characterLocation,
  });

  final CharacterModel? characterModel;
  final CharacterLocation? characterLocation;

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                width: double.infinity,
                                fit: BoxFit.cover,
                                height: 300,
                                "${widget.characterModel?.image}",
                              ),
                              Container(
                                height: 300,
                                color: Colors.black
                                    .withOpacity(0.2), // затемнение изображения
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 100), // для пространства под аватаром
                          Column(
                            children: [
                              Text(
                                widget.characterModel?.name ?? 'Character Name',
                                style: const TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                              ),
                              Text(
                                widget.characterModel?.status?.toUpperCase() ??
                                    'Character Status',
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.green),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудностьи социопатия заставляют беспокоиться семью его дочери.",
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Пол",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey),
                                  ),
                                  Text(
                                    widget.characterModel?.gender ??
                                        'Character Gender',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Расса",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey),
                                  ),
                                  Text(
                                    widget.characterModel?.species ??
                                        'Character Species',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Место рождения",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey),
                                  ),
                                  Text(
                                    widget.characterModel?.origin?.name ??
                                        'Character Origin',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.white,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Место рождения",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey),
                                  ),
                                  Text(
                                    widget.characterLocation?.name ?? "",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.white,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              height: 1,
                              color: AppColors.darkTextEditionColor,
                            ),
                          ),
                          const SizedBox(height: 36),
                          const EpisodeTitleWidget(),
                          const SizedBox(height: 24),
                          // BlocBuilder<EpisodeCubit, EpisodeState>(
                          //   builder: (context, state) {
                          //     if (state is EpisodeLoaded) {
                          //       // Use ListView.builder to render episode list dynamically
                          //       return ListView.builder(
                          //         physics:
                          //             const NeverScrollableScrollPhysics(), // Disable inner scrolling
                          //         shrinkWrap:
                          //             true, // Wrap content inside SingleChildScrollView
                          //         itemCount: state.model.results?.length ?? 0,
                          //         itemBuilder: (context, index) {
                          //           final episode = state.model.results?[index];
                          //           return Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 vertical: 8.0),
                          //             child: Row(
                          //               children: [
                          //                 ClipRRect(
                          //                   borderRadius:
                          //                       BorderRadius.circular(10),
                          //                   child: Container(
                          //                     height: 74,
                          //                     width: 74,
                          //                     color: AppColors.blueGreen,
                          //                     child: Image.network(
                          //                         widget.characterModel?.image ??
                          //                             ""),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(width: 16),
                          //                 Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   children: [
                          //                     Text(
                          //                       "Серия ${episode?.id}"
                          //                           .toUpperCase(),
                          //                       style: const TextStyle(
                          //                         fontSize: 10,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: AppColors.episodeColor,
                          //                       ),
                          //                     ),
                          //                     Text(
                          //                       episode?.name != null &&
                          //                               episode!.name!.length >
                          //                                   15
                          //                           ? '${episode.name?.substring(0, 16)}...'
                          //                           : episode?.name ?? "",
                          //                       style: const TextStyle(
                          //                         fontSize: 16,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: AppColors.white,
                          //                       ),
                          //                     ),
                          //                     Text(
                          //                       episode?.airDate ?? "",
                          //                       style: const TextStyle(
                          //                         fontSize: 14,
                          //                         fontWeight: FontWeight.w400,
                          //                         color: AppColors.grey,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 const Spacer(),
                          //                 IconButton(
                          //                   onPressed: () {},
                          //                   icon: const Icon(
                          //                     Icons.arrow_forward_ios_rounded,
                          //                     size: 20,
                          //                     color: AppColors.white,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     } else if (state is EpisodeLoading) {
                          //       return const Center(
                          //         child: CircularProgressIndicator(
                          //           color: AppColors.green,
                          //         ),
                          //       );
                          //     }
                          //     return const Center(
                          //       child: CircularProgressIndicator(
                          //         color: AppColors.green,
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 210, // корректное позиционирование аватара
                    left: MediaQuery.of(context).size.width / 2 - 80,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: AppColors.darkBgColor,
                      child: CircleAvatar(
                        radius: 73,
                        backgroundImage:
                            NetworkImage(widget.characterModel?.image ?? ''),
                      ),
                    ),
                  ),
                  // Fixed CircleAvatar
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
