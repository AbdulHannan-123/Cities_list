import 'package:cities_list_blocx/models/cities_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CityState extends Equatable{}

class CityLoadingState extends CityState{
  @override
  List<Object?> get props => [];
}

class CityLoadedState extends CityState{
  CityLoadedState(this.cities);
  final List<CityModel> cities;
  @override
  List<Object?> get props => [cities];
}

class CityErrorState extends CityState{
  CityErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
