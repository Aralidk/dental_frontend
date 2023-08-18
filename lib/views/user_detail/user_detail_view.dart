import 'package:dental_workflow/models/all_users_model.dart';
import 'package:dental_workflow/providers/user_detail_provider.dart';
import 'package:dental_workflow/route/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../users/user_controller.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    AllUsers allUser =
        Provider.of<UserDetailProvider>(context, listen: false).allUsers!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 40, backgroundColor: Colors.orange),
              Text(allUser.firstName! + allUser.lastName!),
              Text("Email: ${allUser.email}"),
              Text("Departman: ${allUser.department}"),
              ListTile(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FutureBuilder(
                                future: UserController.getRoles(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        RadioListTile(
                                          value: snapshot.data.data[0],
                                          groupValue: Provider.of<UserDetailProvider>(context).userRole ?? allUser.role,
                                          onChanged: (val) async {
                                            await UserController.updateRole(snapshot.data.data[0]
                                                .toString(), allUser.id!);
                                            Provider.of<UserDetailProvider>(context,listen: false).changeRole(val!);
                                          },
                                          title: Text(snapshot.data.data[0]),
                                        ),
                                        RadioListTile(
                                            title: Text(snapshot.data.data[1]),
                                            value: snapshot.data.data[1]
                                                .toString(),
                                            groupValue: Provider.of<UserDetailProvider>(context).userRole ?? allUser.role,
                                            onChanged: (val)  async{
                                              await UserController.updateRole(snapshot.data.data[1]
                                                  .toString(), allUser.id! );
                                              Provider.of<UserDetailProvider>(context, listen: false).changeRole(val!);
                                            }),
                                        RadioListTile(
                                            title: Text(snapshot.data.data[2]),
                                            value: snapshot.data.data[2]
                                                .toString(),
                                            groupValue: Provider.of<UserDetailProvider>(context).userRole ?? allUser.role,
                                            onChanged: (val) async {
                                              await UserController.updateRole(snapshot.data.data[2]
                                                  .toString(), allUser.id!);
                                              Provider.of<UserDetailProvider>(context, listen: false).changeRole(val!);
                                            }),
                                      ],
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ).whenComplete((){
                      Routemaster.of(context).push(getAllUsers);
                    });
                  },
                  title: Text("Rol - Yetki : ${allUser.role}", textAlign: TextAlign.center,)),
              Text("Kullanıcı Adı : ${allUser.username}"),
              Text("Hesap Aktif : ${allUser.accountNonExpired.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
