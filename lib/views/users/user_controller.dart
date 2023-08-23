import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/urls.dart';
import '../../models/http_response_model.dart';
import 'package:http/http.dart' as http;

class UserController {
  static Future<HTTPResponse> getAllUsers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/auth/users");
    var response = await http.get(url, headers: headers);
    print("aa");
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    print(responseBody);
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

  static Future<HTTPResponse> getRoles() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/auth/user/roles");
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

  static Future<HTTPResponse> updateRole(String role, int id) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}'
    };
    var url = Uri.parse("${apiMobileURL}api/v1/auth/user/update-role/${id}?role=${role}");
    var response = await http.put(url,headers:headers);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      return HTTPResponse(true, statusCode: 200,data: responseBody);
    }
    else{
      return HTTPResponse(true, statusCode: 200,data: null);
    }

  }

  static Future<HTTPResponse> workAssignToUser(String role, workid, String email,
      String lastName, String firstName, int id, String department
      ) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}'
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/work-list/$workid/assign");
    var body = json.encode({
      "id" : id,
      "firstName": firstName,
      "lastName": lastName,
      "email" : email,
      "password": "",
      "department" : department,
      "role": role,
    });
    var response = await http.put(url,headers:headers, body: body);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      return HTTPResponse(true, statusCode: 200,data: responseBody);
    }
    else{
      return HTTPResponse(true, statusCode: 200,data: null);
    }

  }
}