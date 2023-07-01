import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dental_workflow/constants/urls.dart';

import '../models/http_response_model.dart';

class LoginController{
  
  static Future<HTTPResponse> login(String email, String password) async{
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/auth/authenticate");
    var body = json.encode({"email": email, "password": password});
    var response = await http.post(url,body: body, headers:headers);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      return HTTPResponse(true, statusCode: 200,data: responseBody);
    }
    else{
      return HTTPResponse(true, statusCode: 200,data: null);
    }
    
  }
}