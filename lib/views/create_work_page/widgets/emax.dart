import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class EMax extends StatelessWidget {
  const EMax({Key? key}) : super(key: key);

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
      title: const Text("E-max"),
    );
  }
}