import 'package:dental_workflow/providers/work_provider.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MetalTile extends StatelessWidget {
  MetalTile({Key? key, required this.provider}) : super(key: key);
  WorkProvider provider;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: provider.type.values.elementAt(0),
      checkboxShape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      checkColor: dentalBlue,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: dentalBlue,
      tristate: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      title: const Text("Metal"),
      onChanged: (val) {
        provider.changeOperationType(val!, 'isMetal');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
