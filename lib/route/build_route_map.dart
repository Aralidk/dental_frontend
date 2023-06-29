import 'package:dental_workflow/views/create_work_page/create_work.dart';
import 'package:dental_workflow/views/login_page/login_register.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../views/home_page/homepage.dart';

RouteMap Routes = RouteMap(
  routes: {
    '/logOrReg': (_) => const MaterialPage(child: LoginOrRegister()),
    '/'
        //'homePage'
        : (_) => const MaterialPage(child: HomePage()),
    '/createWork': (_) => const MaterialPage(child: CreateWorkPage()),
  },
);
