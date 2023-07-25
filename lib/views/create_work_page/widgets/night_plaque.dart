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
        value: provider.isNigthPlaque,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          //provider.changeNigthPlaque(val!);
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
                  value:  false, onChanged: (val){

                },
                  title: const Text("Sert"),
                ),
              ),
              Expanded(
                child: CheckboxListTile(value: false,
                  activeColor: dentalBlue,
                  checkColor: dentalBlue,
                  checkboxShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onChanged: (val){
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