import 'package:flutter/material.dart';
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
                  const Text("İş Kayıt", style: TextStyle(color: Colors.white)))
      ],
    ),
        ));
  }
}
