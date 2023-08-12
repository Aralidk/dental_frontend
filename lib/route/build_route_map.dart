import 'package:dental_workflow/route/route_paths.dart';
import 'package:dental_workflow/views/create_work_page/create_work.dart';
import 'package:dental_workflow/views/getAllWorks/get_all_works.dart';
import 'package:dental_workflow/views/login_page/login_register.dart';
import 'package:dental_workflow/views/users/users_view.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../views/home_page/homepage.dart';
import '../views/user_detail/user_detail_view.dart';

RouteMap Routes = RouteMap(
  routes: {
    "/" : (_) => splash == "/homePage" ? const MaterialPage(child: HomePage()) : const MaterialPage(child: LoginOrRegister()),
    logOrReg: (_) => const MaterialPage(child: LoginOrRegister()),
    homePage: (_) => const MaterialPage(child: HomePage()),
    createWork: (_) => const MaterialPage(child: CreateWorkPage()),
    getAllWorks: (_) => const MaterialPage(child: GetAllWorks()),
    getAllUsers : (_) => const MaterialPage(child: Users()),
    userDetail : (_) => const MaterialPage(child: UserDetail()),
  },
);
