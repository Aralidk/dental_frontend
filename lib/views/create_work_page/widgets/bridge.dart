import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../providers/work_provider.dart';

class Bridge extends StatelessWidget {
  Bridge({Key? key, required this.provider}) : super(key: key);
  WorkProvider provider;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Checkbox(
        value: provider.type.values.elementAt(3),
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.changeOperationType(val!, 'isBridge');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Ara Gövde"),
    );
  }
}