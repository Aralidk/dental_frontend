import 'dart:convert';
import 'package:dental_workflow/constants/urls.dart';
import '../models/http_response_model.dart';
import 'package:http/http.dart' as http;

class RegisterController{
    static Future<HTTPResponse> Register(String email, String name, String surname, String department, String password) async {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var url = Uri.parse("${apiMobileURL}api/v1/auth/register");
      var body = json.encode({"email": email , "password": password, "firstName": name, "lastName": surname, "department": department});
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