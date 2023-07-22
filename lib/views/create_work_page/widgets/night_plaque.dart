import 'package:dental_workflow/providers/work_provider.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class NightPlaque extends StatelessWidget {
  NightPlaque({Key? key, required this.provider}) : super(key: key);
  WorkProvider provider;

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      leading: Checkbox(
        value: provider.selectedEntities[0].isNigthPlaque ?? false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          provider.selectedWorkModelNightPlaqueUpdate(isNightPlaque: val,teethNumbers: provider.selectedTeethNumbers);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Gece Plağı"),
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: dentalBlue,
                  width: 1
              )
          ),
          child: Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  activeColor: dentalBlue,
                  checkColor: dentalBlue,
                  checkboxShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  value: provider.selectedEntities[0].isHard ?? false, onChanged: (val){
                  provider.selectedWorkModelNightPlaqueTypeUpdate(isHard: true,teethNumbers: provider.selectedTeethNumbers);
                },
                  title: const Text("Sert"),
                ),
              ),
              Expanded(
                child: CheckboxListTile(value: provider.selectedEntities[0].isHard != null ?  !provider.selectedEntities[0].isHard! : false,
                  activeColor: dentalBlue,
                  checkColor: dentalBlue,
                  checkboxShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onChanged: (val){
                    provider.selectedWorkModelNightPlaqueTypeUpdate(isHard: false,teethNumbers: provider.selectedTeethNumbers);
                  },
                  title: const Text("Yumuşak"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}