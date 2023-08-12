import 'package:dental_workflow/models/all_users_model.dart';
import 'package:flutter/material.dart';

class UserDetailProvider extends ChangeNotifier{
  AllUsers? allUsers;
  String? userRole;

  setUser(AllUsers user){
    allUsers = user;
    notifyListeners();
  }

  changeRole(String role){
    userRole = role;
    notifyListeners();
  }

}