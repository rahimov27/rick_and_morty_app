import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/chararcter/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/episode/presentation/cubit/episode_cubit.dart';
import 'package:rick_and_morty_app/features/episode/presentation/widgets/episode_row_widget.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';
import 'package:rick_and_morty_app/features/episode/presentation/widgets/episode_title_widget.dart';

class CharacterDetailsPage extends StatefulWidget {
  final CharacterEntity? characterEntity;
  const CharacterDetailsPage({
    super.key,
    this.characterEntity,
  });

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
    context.read<EpisodeCubit>().getEpisode();
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
                                "${widget.characterEntity?.image}",
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
                                widget.characterEntity?.name ??
                                    'Character Name',
                                style: const TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                              ),
                              Text(
                                widget.characterEntity?.status.toUpperCase() ??
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
                                    widget.characterEntity?.gender ??
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
                                    widget.characterEntity?.species ??
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Место рождения",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey),
                                  ),
                                  Text(
                                    'Character Origin',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.white,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Местоположение",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey),
                                  ),
                                  Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                              Icon(
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

                          SizedBox(
                            height: 400,
                            child: BlocBuilder<EpisodeCubit, EpisodeState>(
                              builder: (context, state) {
                                if (state is EpisodeLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is EpisodeLoaded) {
                                  final episodeData = state.episodes;
                                  return ListView.builder(
                                    itemCount: episodeData.length,
                                    itemBuilder: (context, index) {
                                      return EpisodeRowWidget(
                                        title: state.episodes[index].name,
                                        episode: state.episodes[index].episode,
                                        date: state.episodes[index].airDate,
                                      );
                                    },
                                  );
                                } else if (state is EpisodeError) {
                                  return Center(child: Text(state.error));
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          )
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
                            NetworkImage(widget.characterEntity?.image ?? ''),
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
