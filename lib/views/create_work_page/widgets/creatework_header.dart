import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CreateWorkHeader extends StatelessWidget {
  const CreateWorkHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: salmonPink,
                  width: 1,
                )),
            child: const Text("Müşteri Adı")),
        Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: darkBlue,
                  width: 1,
                )),
            child: const Text("Müşteri Numarası")),
      ],
    );
  }
}