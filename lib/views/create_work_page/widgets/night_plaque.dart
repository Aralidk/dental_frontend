import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class NightPlaque extends StatelessWidget {
  const NightPlaque({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      leading: Checkbox(
        value: false,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Gece Plağı"),
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: salmonPink,
                  width: 1
              )
          ),
          child: Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  activeColor: salmonPink,
                  checkColor: salmonPink,
                  checkboxShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  value: false, onChanged: (val){
                },
                  title: const Text("Sert"),
                ),
              ),
              Expanded(
                child: CheckboxListTile(value: false,
                  activeColor: salmonPink,
                  checkColor: salmonPink,
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