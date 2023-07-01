import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MetalTile extends StatefulWidget {
  const MetalTile({Key? key}) : super(key: key);

  @override
  State<MetalTile> createState() => _MetalTileState();
}

class _MetalTileState extends State<MetalTile> {
  bool implantAbove = false;
  bool metalProofing = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: implantAbove,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {
          setState(() {
            implantAbove = val!;
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Metal"),
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