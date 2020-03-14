
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:purduehcr_web/HTTPError.dart';

import '../User.dart';

class Network {

  static Future<Map<String,dynamic>> get(dynamic path) async {
    print("TESTING GET call to : "+path);
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    print("TESTING headers to : "+headers.toString());
    final response = await http.get(path,headers: headers);
    print("TESTING GET: "+response.body);
    if(response.statusCode == 200 ){
      return json.decode(response.body);
    }else{
      print("GOT HTTP ERROR");
      throw(HttpError(response.statusCode, response.body));
    }
  }

  static Future<Map<String,dynamic>> post(dynamic path, Map<String,dynamic> body) async {
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    final response = await http.post(path,headers: headers, body: body);
    print("TESTING POST: "+response.body);
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw new HttpError(response.statusCode, json.decode(response.body));
    }
  }

  static Future<Map<String,dynamic>> delete(dynamic path) async {
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    final response = await http.delete(path,headers: headers);
    print("TESTING DELETE: "+response.body);
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw new HttpError(response.statusCode, json.decode(response.body));
    }
  }

  static Future<Map<String,dynamic>> put(dynamic path, Map<String,String> headers) async {
    Map<String,String> headers = {"Authorization": "Bearer "+User.user.firebaseToken};
    final response = await http.put(path,headers: headers);
    print("TESTING GET: "+response.body);
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw new HttpError(response.statusCode, json.decode(response.body));
    }
  }

}