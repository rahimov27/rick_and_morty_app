import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/episode/presentation/cubit/episode_cubit.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EpisodeCubit>().getEpisode();

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<EpisodeCubit, EpisodeState>(
        builder: (context, state) {
          if (state is EpisodeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EpisodeLoaded) {
            return ListView.builder(
              itemCount: state.episode.length,
              itemBuilder: (context, index) {
                final episode = state.episode[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    episode.episode,
                    style: const TextStyle(color: AppColors.white),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
