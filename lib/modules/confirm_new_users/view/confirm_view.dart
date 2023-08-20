import 'package:dental_workflow/models/all_users_model.dart';
import 'package:dental_workflow/modules/confirm_new_users/service/confirm_service.dart';
import 'package:flutter/material.dart';

class UnconfirmedUsersView extends StatelessWidget {
  const UnconfirmedUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ConfirmService.getUnconfirmedUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                AllUsers user = AllUsers.fromJson(snapshot.data.data[index]);
                return ListTile(
                  title: Text("${user.firstName} ${user.lastName}"),
                  subtitle: Text(user.department!),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Kullanıcı kaydını yap veya sil"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    ConfirmService.updateConfirm(false, user.id!).then((value) =>
                                    Navigator.pop(context)
                                    );
                                  },
                                  child: const Text(
                                    "Sil",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    ConfirmService.updateConfirm(true, user.id!).then((value) =>
                                        Navigator.pop(context)
                                    );
                                  },
                                  child: const Text(
                                    "Onayla",
                                    style: TextStyle(color: Colors.green),
                                  )),
                            ],
                          );
                        });
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
