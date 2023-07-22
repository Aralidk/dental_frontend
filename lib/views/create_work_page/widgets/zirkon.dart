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
        value: provider.selectedEntities[0].isZirkon ?? false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.selectedWorkModelZirkonUpdate(isZirkon: val, teethNumbers: provider.selectedTeethNumbers);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Zirkon"),
      children: [
        CheckboxListTile(
          value: provider.selectedEntities[0].isZirkonAbove ?? false,
          activeColor: dentalBlue,
          onChanged: (val) {
            provider.selectedWorkModelZirkonUpdate(isZirkon: provider.selectedEntities[0].isZirkon, isZirkonAbove: val, isZirkonProva: provider.selectedEntities[0].isZirkonProva, teethNumbers: provider.selectedTeethNumbers);
          },
          checkColor: dentalBlue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Zirkon Üstü"),
        ),
        CheckboxListTile(
          value:provider.selectedEntities[0].isZirkonProva ?? false,
          activeColor: dentalBlue,
          onChanged: (val) {
            provider.selectedWorkModelZirkonUpdate(isZirkon: provider.selectedEntities[0].isZirkon, isZirkonAbove:  provider.selectedEntities[0].isZirkonAbove, isZirkonProva: val, teethNumbers: provider.selectedTeethNumbers);
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