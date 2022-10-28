import 'dart:convert';

import '../models/cities_model.dart';
import 'package:http/http.dart' as http;

class CityRepositories{
  var endpoint =Uri.parse('fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&token=c9727aafe0b62daf164f0616a4c4e0f2&lang_id=1&country_id=189');
 Future<List<CityModel>> getCity()async{
    final responce = await http.get(endpoint);
    print(responce.statusCode);
    if(responce.statusCode == 200){
      print('ye chala');
      print(jsonDecode(responce.body)["data"]);
      print('ye bhi chala');
      final List result = jsonDecode(responce.body)["data"];
      return result.map((e) => CityModel.fromJson(e)).toList();
    }
    else{
      throw Exception(responce.reasonPhrase);
    }
  }
}