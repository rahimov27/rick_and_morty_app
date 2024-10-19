import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/data/repositories/dio_settings.dart';
import 'package:rick_and_morty_app/data/repositories/get_chars_repo.dart';
import 'package:rick_and_morty_app/data/repositories/get_location_repo.dart';
import 'package:rick_and_morty_app/presentation/blocs/chars_bloc/chars_bloc.dart';
import 'package:rick_and_morty_app/presentation/blocs/locations_bloc/location_bloc.dart';
import 'package:rick_and_morty_app/presentation/screens/character_details_page.dart';
import 'package:rick_and_morty_app/presentation/screens/splash_screen.dart';
import 'package:rick_and_morty_app/presentation/theme/theme_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => DioSettings(),
            ),
            RepositoryProvider(
              create: (context) => GetCharsRepo(
                  dio: RepositoryProvider.of<DioSettings>(context).dio),
            ),
            RepositoryProvider(
              create: (context) => GetLocationRepo(
                  dio: RepositoryProvider.of<DioSettings>(context).dio),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CharsBloc(
                  repo: RepositoryProvider.of<GetCharsRepo>(context),
                ),
              ),
              BlocProvider(
                create: (context) => LocationBloc(
                  repo: RepositoryProvider.of<GetLocationRepo>(context),
                ),
              ),
            ],
            child: MaterialApp(
              theme: context.watch<ThemeProvider>().theme,
              home: const SplashScreen(),
            ),
          ),
        );
      }),
    );
  }
}
