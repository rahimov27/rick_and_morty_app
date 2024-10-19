import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/presentation/blocs/locations_bloc/location_bloc.dart';
import 'package:rick_and_morty_app/presentation/widgets/location_widget.dart';

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
      BlocProvider.of<LocationBloc>(context).add(GetLocationEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationSucess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.model.results?.length ?? 0,
                        itemBuilder: (context, index) {
                          final location = state.model.results?[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: LocationWidget(location: location!),
                          );
                        },
                      ),
                    );
                  } else if (state is LocationLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LocationError) {
                    return Center(
                      child: Text("Ошибка: ${state.error}"),
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
