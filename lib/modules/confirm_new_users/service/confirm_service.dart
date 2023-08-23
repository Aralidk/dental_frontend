import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../constants/urls.dart';
import '../../../models/http_response_model.dart';

class ConfirmService{


  static Future<HTTPResponse> getUnconfirmedUsers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}',
    };
    var url = Uri.parse("${apiMobileURL}api/v1/auth/users/unconfirmed");
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

  static Future<HTTPResponse> updateConfirm(bool status, int id) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('token')}'
    };
    var url = Uri.parse("${apiMobileURL}api/v1/auth/user/update-confirm/$id");
    var body = json.encode(status);
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