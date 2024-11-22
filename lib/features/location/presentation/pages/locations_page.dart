import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/pages/characters_page.dart';
import 'package:rick_and_morty_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:rick_and_morty_app/features/location/presentation/widgets/location_widget.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  @override
  void initState() {
    super.initState();

    // Вызов события после первой отрисовки страницы
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<LocationBloc>(context).add(LoadLocationsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationLoading) {
                return const AppCircularWidget();
              }
              if (state is LocationLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.locations.length,
                    itemBuilder: (context, index) {
                      final location = state.locations[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: LocationWidget(location: location),
                      );
                    },
                  ),
                );
              } else if (state is LocationError) {
                return Text("Error: ${state.error}");
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
