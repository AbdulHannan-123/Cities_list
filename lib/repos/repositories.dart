import 'dart:convert';

import 'package:http/http.dart';

class UserRepositories{
  String endpoint = 'https://fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&token=c9727aafe0b62daf164f0616a4c4e0f2&lang_id=1&country_id=189';
  getUser()async{
    Response responce = await get(Uri.parse(endpoint));
    if(responce.statusCode == 200){
      final List result = jsonDecode(responce.body)['data'];
    }
    else{
      throw Exception(responce.reasonPhrase);
    }
  }
}