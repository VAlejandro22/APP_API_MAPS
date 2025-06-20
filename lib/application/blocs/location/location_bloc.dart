import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_event.dart';
import 'location_state.dart';
import '../../../domain/usecases/get_current_location.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCurrentLocation getCurrentLocation;

  LocationBloc({required this.getCurrentLocation}) : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      emit(LocationLoading());

      try {
        final location = await getCurrentLocation();
        emit(LocationLoaded(location));
      } catch (e) {
        emit(LocationError("Error al obtener ubicación: ${e.toString()}"));
      }
    });
  }
}
