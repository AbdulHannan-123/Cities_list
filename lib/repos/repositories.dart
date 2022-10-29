

import 'dart:convert';

import '../models/cities_model.dart';
import 'package:http/http.dart' as http;

class CityRepositories{
  var endpoint =Uri.parse('fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&token=99c3263ffe3e476c6bbbb8087e45e183&lang_id=1&country_id=189');
 Future<List<CityModel>> getCity()async{
    final responce = await http.get(endpoint);
    
    if(responce.statusCode == 200){
      print('ye chala');
      print('ye nhi chala');
      final List result = jsonDecode(responce.body)["data"];
      print(result);
      return result.map(((e) => CityModel.fromJson(e))).toList();
    }
    else{
      throw Exception(responce.reasonPhrase);
    }
  }
}