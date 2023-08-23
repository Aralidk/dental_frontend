import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/urls.dart';
import '../models/http_response_model.dart';
import 'package:http/http.dart' as http;

class WorkStatusController{

  static Future<HTTPResponse> getWorkStatus(int workId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };

     print(preferences.getString('token'));
    var url = Uri.parse("${apiMobileURL}api/v1/status/get/$workId/status");
    var response = await http.get(url, headers: headers);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return HTTPResponse(true,
          message: "Succes", statusCode: 200, data: responseBody);
    } else {
      return HTTPResponse(false,
          message: "Error",
          statusCode: 400,
          data: null);
    }
  }


  static Future<HTTPResponse> getAllStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/status/get/work-status");
    var response = await http.get(url, headers: headers);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return HTTPResponse(true,
          message: "Succes", statusCode: 200, data: responseBody);
    } else {
      return HTTPResponse(false,
          message: "Error",
          statusCode: 400,
          data: null);
    }
  }

  static Future<HTTPResponse> updateWorkStatus(String status, int id) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}'
    };
    var url = Uri.parse("${apiMobileURL}api/v1/status/update/$id");
    var body = json.encode({
      "status" : status
    });
    var response = await http.put(url,headers:headers, body: body);
   // var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      return HTTPResponse(true, statusCode: 200,data: response.body);
    }
    else{
      return HTTPResponse(true, statusCode: 200,data: null);
    }

  }

  static Future<HTTPResponse> filterBystatus(String status) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}'
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list/filter");
    var body = json.encode({"status" : status});
    var response = await http.put(url,body: body,headers:headers);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      return HTTPResponse(true, statusCode: 200,data: responseBody);
    }
    else{
      return HTTPResponse(true, statusCode: 200,data: null);
    }

  }
}