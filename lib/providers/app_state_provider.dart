import 'package:dental_workflow/services/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateProvider extends ChangeNotifier{
  String? token;
  String? role;
  bool loggedIn = false;

  Future<bool> userLog(String email, String password) async{
    SharedPreferences preferences = await  SharedPreferences.getInstance();
    LoginController.login(email, password).then((response){
      if(response.isSuccessful! && response.data != null){
        token = response.data["token"];
        loggedIn = true;
        preferences.setString("token", token!);
        preferences.setBool("loggedIn", true);
      }
    });
    return loggedIn;
  }
}