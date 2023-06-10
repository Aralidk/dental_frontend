import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BottomSheetPointer extends StatelessWidget {
  const BottomSheetPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: darkBlue,
        ),
      ),
    );
  }
}
