import 'dart:convert';
import '../constants/urls.dart';
import '../models/http_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/work_model.dart';

class WorkController{
  static Future<HTTPResponse> createWork(List<WorkModel> workModel, String token) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/create-work/create");
    var body = json.encode(workModel);
    var response = await http.post(url, body: body, headers: headers);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if (responseBody["success"] == true) {
      return HTTPResponse(true,
          message: responseBody["message"], statusCode: response.statusCode);
    } else {
      return HTTPResponse(false,
          message: responseBody["message"],
          statusCode: response.statusCode,
          data: null);
    }
  }
}