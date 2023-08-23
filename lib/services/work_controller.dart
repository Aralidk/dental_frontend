import 'dart:convert';
import 'package:dental_workflow/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/urls.dart';
import '../models/http_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/work_model.dart';

class WorkController{
  static Future<HTTPResponse> createWork(WorkModel workModel, String token) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/create");
    List<Map<String, dynamic>> workEntitiesJsonList = workModel.workEntities!
        .map((workEntity) => workEntity.toJson())
        .toList();
    print(workEntitiesJsonList);
    var body =
    json.encode(
      {
        "workEntities" : workEntitiesJsonList
      }
    );
    var response = await http.post(url, body: body, headers: headers);
    if (response.body.toString().startsWith("WorkEntities created with IDs")) {
      return HTTPResponse(true,
          message: "Succes", statusCode: 200);
    } else {
      return HTTPResponse(false,
          message: "Error",
          statusCode: 400,
          data: null);
    }
  }

  static Future<HTTPResponse> getAllWorks() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(preferences.getString('token'));
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list");
    print("here");
    var response = await http.get(url, headers: headers);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    print("response");
    if (response.statusCode == 200) {
      print("succes");
      return HTTPResponse(true,
          message: "Succes", statusCode: 200, data: responseBody);
    } else {
      print(responseBody);
      return HTTPResponse(false,
          message: "Error",
          statusCode: 400,
          data: null);
    }
  }

  static Future<HTTPResponse> getNotDelivered() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list/not-delivered");
    var response = await http.get(url, headers: headers);
    print(response.body);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      print(responseBody);
      return HTTPResponse(true,
          message: "Succes", statusCode: 200, data: responseBody);
    } else {

      return HTTPResponse(false,
          message: "Error",
          statusCode: 400,
          data: null);
    }
  }

  static Future<HTTPResponse> assignUser(UserModel user, int id) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}'
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list/assign/$id");
    var body = json.encode(user.toJson());
    var response = await http.put(url,headers:headers, body: body);
    // var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      return HTTPResponse(true, statusCode: 200,data: response.body);
    }
    else{
      return HTTPResponse(true, statusCode: 200,data: null);
    }

  }

  static Future<HTTPResponse> getByUser(userId, userRole) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list-byuser");
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

  static Future<HTTPResponse> filterOrder(String sortBy) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list/filter-by-date?sortBy=$sortBy");
    var response = await http.get(url, headers: headers);
    print(response.body);
    print(response.statusCode);
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

  static Future<HTTPResponse> filterOrderByMonth(int id) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list/filter-by-month?month=$id");
    var response = await http.get(url, headers: headers);
    print(response.body);
    print(response.statusCode);
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
}