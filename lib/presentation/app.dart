import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../application/blocs/location/location_bloc.dart';
import '../application/blocs/location/location_event.dart';
import '../domain/usecases/get_current_location.dart';
import '../data/repositories/location_repository_impl.dart';
import '../data/datasources/location_datasource.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Geolocalización',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => LocationBloc(
          getCurrentLocation: GetCurrentLocation(
            LocationRepositoryImpl(LocationDataSourceImpl()),
          ),
        )..add(GetLocationEvent()),
        child: const HomePage(),
      ),
    );
  }
}
