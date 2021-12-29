import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:geos_api/parser.dart';
import 'package:geos_api/result_data.dart';
import 'package:http/http.dart' as http;

import 'consts.dart';
import 'info.dart';


Future<ResultData> fetchData(String username, String password) async{
  String uri = protocol + domain + '/worker/index.php?route=common/login/api_login';
  var dio = Dio();
  Parser parser = Parser();
  var formData = FormData.fromMap({
    'username': username,
    'password': password
  });

  final response = await dio.post(uri, data: formData);

  var cookieJar=CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  Future<List<Cookie>> cookies = cookieJar.loadForRequest(Uri.parse(uri));


  List<String>? data = response.headers.map["set-cookie"];
  Map<String, dynamic> cookieMap = parser.parseCookies(data!);

  var testR = getInfo(cookieMap);
  //response.headers.map["set-cookie"]

  if(response.statusCode == 200){
    return ResultData.fromMap(response.data);
  } else {
    throw Exception('error');
  }

}
Future<Info> getInfo(Map<String, dynamic> map) async{
  String uri = protocol + domain + '/worker/index.php?route=common/login/api_get_info';
  HttpClient client = new HttpClient();
  HttpClientRequest clientRequest = await client.postUrl(Uri.parse(uri));


  for(int i = 0; i < map.length; i++){
    List<String> parts = map.values.elementAt(i).toString().split(';');
    clientRequest.cookies.add(Cookie(map.keys.elementAt(i).toString(), parts[0]));


  }

  HttpClientResponse clientResponse = await clientRequest.close();



  var dio = Dio();
  dio.options.headers = map;
  final response = await dio.post(uri);
  if(response.statusCode == 200){
    return Info.fromMap(response.data);
  } else {
    throw Exception('error');
  }

}