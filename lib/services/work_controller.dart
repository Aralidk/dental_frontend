import 'dart:convert';
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

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    print(preferences.getString('token'));
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list");
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
}