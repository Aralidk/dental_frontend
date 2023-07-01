import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Zirkon extends StatefulWidget {
  const Zirkon({Key? key}) : super(key: key);

  @override
  State<Zirkon> createState() => _ZirkonState();
}

class _ZirkonState extends State<Zirkon> {
  bool implantAbove = false;
  bool metalProofing = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: false,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Zirkon"),
      children: [
        CheckboxListTile(
          value: implantAbove,
          activeColor: salmonPink,
          onChanged: (val) {
            setState(() {
              implantAbove = val!;
            });
          },
          checkColor: salmonPink,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("İmplant Üstü"),
        ),
        CheckboxListTile(
          value: metalProofing,
          activeColor: salmonPink,
          onChanged: (val) {
            setState(() {
              metalProofing = val!;
            });
          },
          checkColor: salmonPink,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Metal Prova Gelsin"),
        ),
      ],
    );
  }
}