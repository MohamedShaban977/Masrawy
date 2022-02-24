// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

class DioHelper {

  static final _baseUrl = 'https://www.masrawy.com/APIMSIGEMINI/';

  static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;

  static Future<Response<dynamic>> post(String path,{Map<String, dynamic> headers,Map<String, dynamic> body}){
    // dio.options.headers = {
    //   'Authorization': 'Bearer ${loggedUser.apiToken}'
    // };
    dioSingleton.options.headers = headers;
    final response = dioSingleton.post(path,data: FormData.fromMap(body));
    // dio.options.headers = null;
    return response;
  }

  static Future<Response<dynamic>> get(String path,{Map<String, dynamic> headers,Map<String, dynamic> params}){
    // dio.options.headers = {
    //   'Authorization': 'Bearer ${loggedUser.apiToken}'
    // };
    dioSingleton.options.headers = headers;
    final response = dioSingleton.get(path,queryParameters: params);
    // dio.options.headers = null;
    return response;
  }

}