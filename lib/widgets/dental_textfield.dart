import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../styles/text_styles.dart';

class DentalTextfield extends StatelessWidget {
  String? label;
  Function? onChange;
  TextEditingController? controller;
  TextInputType? inputType;
  DentalTextfield({Key? key, this.label, this.onChange, this.controller, this.inputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          onChanged:  (value){
            onChange;
          },
          keyboardType: inputType,
          maxLines: null,
          decoration: InputDecoration(
              labelStyle: labelStyle,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              label: Text(label ?? "", style: const TextStyle(
                  fontSize: 18
              )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: skyBlue,
                      width: 1
                  )
              )
          ),
        ),
      );
  }
}