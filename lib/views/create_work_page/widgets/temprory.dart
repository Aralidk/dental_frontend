import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Temprory extends StatelessWidget {
  const Temprory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Checkbox(
        value: false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Geçici"),
      //children: [
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: TextField(
      //     keyboardType: TextInputType.number,
      //     decoration: InputDecoration(
      //         labelStyle: labelStyle,
      //         floatingLabelBehavior: FloatingLabelBehavior.auto,
      //         label: const Text("Özel Lab Notu"),
      //         border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(12),
      //             borderSide: BorderSide(
      //                 color: salmonPink,
      //                 width: 1
      //             )
      //         )
      //     ),
      //   ),
      // ),
      // ],
    );
  }
}