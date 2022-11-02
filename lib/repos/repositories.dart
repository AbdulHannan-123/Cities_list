

import 'dart:convert';

import '../models/cities_model.dart';
import 'package:http/http.dart';

class CityRepositories{
  var endpoint ='https://fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&token=99c3263ffe3e476c6bbbb8087e45e183&lang_id=1&country_id=189';
  var startpoint='https://fluttertest.q3logics.com/api/trial?device_id=123456&token=?&lang_id=1';
 Future<List<CityModel>> getCity()async{
    final responce = await get(Uri.parse(startpoint), headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });
    // final responce2 = await http.get(Uri.parse(startpoint));
    print(responce.body);
    
    if(responce.statusCode == 200){
      print('ye chala');
      print('ye nhi chala');
      final data = jsonDecode(responce.body)["data"];
      final dee = jsonDecode(data);
      print(dee);
      final List result = jsonDecode(responce.body)["data"];
      print(result);
      return result.map(((e) => CityModel.fromJson(e))).toList();
    }
    else{
      throw Exception(responce.reasonPhrase);
    }
  }
}