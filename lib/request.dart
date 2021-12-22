import 'dart:convert';
import 'dart:developer';

import 'package:geos_api/result_data.dart';
import 'package:http/http.dart' as http;

import 'consts.dart';


Future<ResultData> fetchData(String username, String password) async{

  final testPost = await testPostRequest();


  String uri = protocol + domain + '/worker/index.php?route=common/login/api_login';
  final responce = await http.post(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: 'username=Helper&password=G6bu9Mer3s'
      );
/*
  body: <String, String>{
    'username': username,
    'password': password,
    'logintype': '2'
  }));
*/


  log(testPost.body);
  log(responce.body);
  log(uri);
  bool isError = false;
  if(responce.statusCode == 200){
    return ResultData.fromMap(jsonDecode(responce.body));
  } else {
    isError = true;
    throw Exception('error');
  }
}

Future<http.Response> testPostRequest(){
  return http.post(
    Uri.parse("https://dev.geos.help/worker/index.php?route=common/login/api_login"),
    body: jsonEncode(<String, String>{
      'username': 'Helper',
      'password': 'G6bu9Mer3s'
    })
  );
}