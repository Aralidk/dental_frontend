import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../providers/work_provider.dart';

class Zirkon extends StatelessWidget {
  WorkProvider provider;
  Zirkon({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: provider.selectedEntities?.isZirkon ?? false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.selectedWorkModelZirkonUpdate(isZirkon: val);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Zirkon"),
      children: [
        CheckboxListTile(
          value: provider.selectedEntities?.isZirkonAbove ?? false,
          activeColor: dentalBlue,
          onChanged: (val) {
            provider.selectedWorkModelZirkonUpdate(isZirkon: provider.selectedEntities?.isZirkon, isZirkonAbove: val, isZirkonProva: provider.selectedEntities?.isZirkonProva);
          },
          checkColor: dentalBlue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Zirkon Üstü"),
        ),
        CheckboxListTile(
          value:provider.selectedEntities?.isZirkonProva ?? false,
          activeColor: dentalBlue,
          onChanged: (val) {
            provider.selectedWorkModelZirkonUpdate(isZirkon: provider.selectedEntities?.isZirkon, isZirkonAbove:  provider.selectedEntities?.isZirkonAbove, isZirkonProva: val);
          },
          checkColor: dentalBlue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Zirkon Prova Gelsin"),
        ),
      ],
    );
  }
}