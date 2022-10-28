import 'package:flutter/cupertino.dart';

class CityModel {
  final int id;
  final String name;
  final String countid;

  CityModel({required this.id, required this.name, required this.countid});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        id: json['id'], name: json['name'], countid: json['country_id']);
  }
}
