import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:rocket/rocketModel.dart';

class ApiServices{
  String endPoint = 'https://api.spacexdata.com/v4/rockets';
  Future<List<RocketModel>>getRockets() async {
    Response response = await get(Uri.parse(endPoint));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body);
      return result.map((e) => RocketModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}
final rocketProvider = Provider<ApiServices>((ref)=> ApiServices());