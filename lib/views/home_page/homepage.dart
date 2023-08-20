import 'package:dental_workflow/providers/app_state_provider.dart';
import 'package:dental_workflow/route/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import '../../styles/button_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          TextButton(
              onPressed: () {
                Routemaster.of(context).push("/createWork");
              },
              style: blueButton,
              child:
                  const Text("İş Kayıt", style: TextStyle(color: Colors.white))),
        const SizedBox(height: 20),
       // Provider.of<AppStateProvider>(context, listen :false).user?.role == "ADMIN" ?
        Column(
          children: [
            TextButton(
                onPressed: () {
                  Routemaster.of(context).push("/getAllWorks");
                },
                style: blueButton,
                child:
                const Text("İşleri Listele", style: TextStyle(color: Colors.white))),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Routemaster.of(context).push("/getAllUsers");
                },
                style: blueButton,
                child:
                const Text("Kullanıcıları Listele", style: TextStyle(color: Colors.white))),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Routemaster.of(context).push(waitingConfirmation);
                },
                style: blueButton,
                child:
                const Text("Onay Bekleyen Kullanıcılar", style: TextStyle(color: Colors.white)))
          ],
        )
            //: const  SizedBox()
      ],
    ),
        ));
  }
}
