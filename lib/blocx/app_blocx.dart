

import 'package:cities_list_blocx/blocx/app_events.dart';
import 'package:cities_list_blocx/blocx/app_state.dart';
import 'package:cities_list_blocx/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityBloc extends Bloc<CityEvent, CityState>{
  final CityRepositories _cityRepositories;

  CityBloc(this._cityRepositories) : super(CityLoadingState()){
    on<LoadCityEvent>((event, emit)async {
      emit(CityLoadingState());
      try {
        print('try start');
        final cities = await _cityRepositories.getCity();
        print("values");
        emit(CityLoadedState(cities));
      } catch (e) {
        emit(CityErrorState(e.toString()));
      }
    } );
  }
}