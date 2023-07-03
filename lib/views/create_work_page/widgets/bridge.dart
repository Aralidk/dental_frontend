import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class Bridge extends StatelessWidget {
  const Bridge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Checkbox(
        value: false,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Köprü"),
    );
  }
}