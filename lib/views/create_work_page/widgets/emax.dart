import 'package:dental_workflow/providers/work_provider.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class EMax extends StatelessWidget {
  EMax({Key? key, required this.provider}) : super(key: key);
  WorkProvider provider;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Checkbox(
        value:  provider.type.values.elementAt(2),
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.changeOperationType(val!, 'isEmax');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("E-max"),
    );
  }
}