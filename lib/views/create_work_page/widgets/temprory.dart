import 'package:dental_workflow/providers/work_provider.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Temprory extends StatelessWidget {
  Temprory({Key? key, required this.provider}) : super(key: key);
  WorkProvider provider;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Checkbox(
        value:  provider.type.values.elementAt(4),
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.changeOperationType(val!, 'isTemp');
        },
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