import 'dart:convert';

import 'package:geos_api/result_data.dart';
import 'package:http/http.dart' as http;

import 'consts.dart';


Future<ResultData> fetchData(String username, String password) async{

  String uri = protocol + domain + '/customer/index.php?route=common/login/api_login&username=' + username + '&password=' + password + '&logintype=' + loginType.toString();
  final responce = await http.get(Uri.parse(uri));
  bool isError = false;
  if(responce.statusCode == 200){
    return ResultData.fromMap(jsonDecode(responce.body));
  } else {
    isError = true;
    throw Exception('error');
  }
}