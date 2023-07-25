import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../providers/work_provider.dart';

class Zirkon extends StatelessWidget {
  WorkProvider provider;
  Zirkon({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      checkboxShape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      activeColor: skyBlue,
      title: const Text('Zirkon'),
      value: provider.type.values.elementAt(1),
      checkColor: dentalBlue,
      onChanged: (val) {
        provider.changeOperationType(val!, 'isZirkon');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
