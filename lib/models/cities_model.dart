import 'package:flutter/cupertino.dart';

class CityModel {
  final int id;
  final String name;
  final int countid;

  CityModel({required this.id, required this.name, required this.countid});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        id: json["id"] ?? "ID", name: json["name"] ?? "NAME", countid: json["country_id"] ?? "countryID");
  }
}
