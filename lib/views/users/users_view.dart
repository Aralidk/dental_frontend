
import 'package:dental_workflow/models/all_users_model.dart';
import 'package:dental_workflow/models/http_response_model.dart';
import 'package:dental_workflow/views/users/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../../providers/user_detail_provider.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<HTTPResponse>(
        future: UserController.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData && Routemaster.of(context).currentRoute.path == "/getAllUsers"){
          return ListView.builder(
            itemCount: snapshot.data.data.length,
            itemBuilder: (BuildContext context, int index) {
              AllUsers allUsers = AllUsers.fromJson(snapshot.data.data[index]);
            return ListTile(
                onTap: (){
                  Provider.of<UserDetailProvider>(context, listen: false).setUser(allUsers);
                  Routemaster.of(context).push("/userDetail");
                },
                title :Text(allUsers.firstName! + allUsers.lastName!));
          },);
        }
        else if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else{
          return const Text("hata");
        }
      },),
    );
  }
}
