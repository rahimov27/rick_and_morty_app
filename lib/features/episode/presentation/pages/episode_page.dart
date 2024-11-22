import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/episode/presentation/cubit/episode_cubit.dart';
import 'package:rick_and_morty_app/features/episode/presentation/widgets/episode_row_widget.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EpisodeCubit>().getEpisode();
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            title: const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.darkTextEditionColor,
                hintText: "Найти эпизод",
                hintStyle: TextStyle(color: AppColors.textField),
                prefixIcon: Icon(Icons.search, color: AppColors.textField),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              style: TextStyle(color: Colors.white),
            ),
            flexibleSpace: Container(),
            bottom: const TabBar(
              tabAlignment: TabAlignment.center,
              unselectedLabelColor: AppColors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: EdgeInsets.symmetric(horizontal: 16),
              dividerColor: Colors.transparent,
              indicatorWeight: 0.5,
              indicatorPadding: EdgeInsets.symmetric(vertical: 5),
              indicatorColor: AppColors.white,
              isScrollable: true,
              labelStyle: TextStyle(
                fontSize: 14,
                color: AppColors.white,
              ),
              tabs: <Widget>[
                Tab(text: "СЕЗОН 1"),
                Tab(text: "СЕЗОН 2"),
                Tab(text: "СЕЗОН 3"),
                Tab(text: "СЕЗОН 4"),
                Tab(text: "СЕЗОН 5"),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 26),
          child: TabBarView(
            children: <Widget>[
              Column(
                children: [
                  BlocBuilder<EpisodeCubit, EpisodeState>(
                    builder: (context, state) {
                      if (state is EpisodeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is EpisodeLoaded) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.episodes.length,
                            itemBuilder: (context, index) {
                              return EpisodeRowWidget(
                                title: state.episodes[index].name,
                                episode: state.episodes[index].episode,
                                date: state.episodes[index].airDate,
                              );
                            },
                          ),
                        );
                      } else if (state is EpisodeError) {
                        return Text(state.error);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              const Center(
                  child: Text("Сезон 2",
                      style: TextStyle(fontSize: 20, color: AppColors.white))),
              const Center(
                  child: Text("Сезон 3",
                      style: TextStyle(fontSize: 20, color: AppColors.white))),
              const Center(
                  child: Text("Сезон 4",
                      style: TextStyle(fontSize: 20, color: AppColors.white))),
              const Center(
                  child: Text("Сезон 5",
                      style: TextStyle(fontSize: 20, color: AppColors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
