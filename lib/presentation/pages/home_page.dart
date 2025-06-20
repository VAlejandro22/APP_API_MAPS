import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/blocs/location/location_bloc.dart';
import '../../application/blocs/location/location_state.dart';
import '../widgets/location_info_widget.dart';
import '../widgets/google_map_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocalización en Flutter'),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LocationLoaded) {
            return Column(
              children: [
                Expanded(child: GoogleMapWidget(location: state.location)),
                LocationInfoWidget(location: state.location),
              ],
            );
          } else if (state is LocationError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("Esperando ubicación..."));
        },
      ),
    );
  }
}
