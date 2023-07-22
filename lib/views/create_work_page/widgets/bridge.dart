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
        value: provider.selectedEntities[0].isBridge ?? false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.selectedWorkModelBridgeUpdate(isBridge: val, teethNumbers: provider.selectedTeethNumbers);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Köprü"),
    );
  }
}