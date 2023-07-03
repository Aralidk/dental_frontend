
import 'package:dental_workflow/providers/work_provider.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MetalTile extends StatelessWidget {
  MetalTile({Key? key, required this.provider}) : super(key: key);
  WorkProvider provider;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: provider.selectedEntities?.isMetal ?? false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.selectedWorkModelMetalUpdate(isMetal: val);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Metal"),
      children: [
        CheckboxListTile(
          value: provider.selectedEntities?.isMetalAbove ?? false,
          activeColor: dentalBlue,
          onChanged: (val) {
            provider.selectedWorkModelMetalUpdate(isMetalAbove: val, isMetal: provider.selectedEntities?.isMetal, isMetalProva:provider.selectedEntities?.isMetalProva  );
          },
          checkColor: dentalBlue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("İmplant Üstü"),
        ),
        CheckboxListTile(
          value: provider.selectedEntities?.isMetalProva ?? false,
          activeColor: dentalBlue,
          onChanged: (val) {
            provider.selectedWorkModelMetalUpdate(isMetalAbove:  provider.selectedEntities?.isMetalAbove, isMetal: provider.selectedEntities?.isMetal, isMetalProva: val);
          },
          checkColor: dentalBlue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Metal Prova Gelsin"),
        ),
      ],
    );
  }
}