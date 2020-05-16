
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:purduehcr_web/Models/HTTPError.dart';

import '../Models/User.dart';

class Network {

  static Future<dynamic> get(String path, {Map<String, dynamic> params}) async {
    path = path + _serializeParams(params);
    print("TESTING GET call to : "+path+" and token: "+User.user.firebaseToken);
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    final response = await http.get(path,headers: headers);
    if(response.statusCode == 200 ){
      return json.decode(response.body);
    }else{
      throw(HttpError(response.statusCode, response.body));
    }
  }

  static Future<Map<String,dynamic>> post(String path, {Map<String,dynamic> body, Map<String, dynamic> params}) async {
    path = path + _serializeParams(params);
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    print("HEADERS: "+headers.toString());
    print("BODY: "+body.toString());
    final response = await http.post(path,headers: headers, body: body);
    if(isSuccessCode(response.statusCode)){
      print("GOT JSON: "+response.body.toString() );
      return Future.value(json.decode(response.body));
    }else{
      print("GOT ERROR: "+response.statusCode.toString() +": "+response.body.toString());
      return Future.error(HttpError(response.statusCode, json.decode(response.body)));
    }
  }

  static Future<Map<String,dynamic>> delete(String path) async {
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    final response = await http.delete(path,headers: headers);
    if(isSuccessCode(response.statusCode)){
      return json.decode(response.body);
    }else{
      throw new HttpError(response.statusCode, json.decode(response.body));
    }
  }

  static Future<Map<String,dynamic>> put(String path, Map<String,String> headers) async {
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    final response = await http.put(path,headers: headers);
    if(isSuccessCode(response.statusCode)){
      return json.decode(response.body);
    }else{
      throw new HttpError(response.statusCode, json.decode(response.body));
    }
  }

  static String _serializeParams(Map<String, dynamic> params) {
    if (params == null || params.isEmpty) {
      return "";
    }
    else {
      String queryString = "?";
      for (String key in params.keys) {
        queryString += key + "+" + params[key].toString() + "&";
      }
      return queryString.substring(0, queryString.length - 2);
    }
  }

  static bool isSuccessCode(num code){
    return code == 200 || code == 201 || code == 202;
  }
}