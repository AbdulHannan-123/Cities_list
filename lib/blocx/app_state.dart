import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CityState extends Equatable{}

class CityLoadingState extends CityState{
  @override
  List<Object?> get props => [];
}