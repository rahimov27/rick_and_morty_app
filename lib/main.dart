import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/features/chararcter/data/repositories/character_repository_impl.dart.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/episode/data/datasources/episode_remote_data_source.dart';
import 'package:rick_and_morty_app/features/episode/data/repositories/episode_repositories.dart';
import 'package:rick_and_morty_app/features/episode/presentation/cubit/episode_cubit.dart';
import 'package:rick_and_morty_app/features/location/data/datasources/location_remote_datasource.dart';
import 'package:rick_and_morty_app/features/location/data/repositories/location_repository_impl.dart';
import 'package:rick_and_morty_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:rick_and_morty_app/shared/dio_settings.dart';
import 'package:rick_and_morty_app/shared/theme/theme_provider.dart';
import 'package:rick_and_morty_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = DioSettings().dio;

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (_) => CharacterRepositoryImpl(dio: dio),
              ),
              RepositoryProvider(
                create: (_) => EpisodeRepositoryImpl(
                    remoteDataSource: EpisodeRemoteDataSourceImpl(dio: dio)),
              ),
              RepositoryProvider(
                create: (_) => LocationRepositoryImpl(
                    remoteDataSource: LocationRemoteDataSourceImpl(dio: dio)),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CharacterBloc(
                    repository:
                        RepositoryProvider.of<CharacterRepositoryImpl>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => EpisodeCubit(
                      RepositoryProvider.of<EpisodeRepositoryImpl>(context)),
                ),
                BlocProvider(
                  create: (context) => LocationBloc(
                    repository:
                        RepositoryProvider.of<LocationRepositoryImpl>(context),
                  ),
                ),
              ],
              child: MaterialApp(
                title: 'Rick and Morty App',
                theme: context.watch<ThemeProvider>().theme,
                home: const HomeScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
