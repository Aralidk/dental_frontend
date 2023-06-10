import 'package:dental_workflow/widgets/bottom_sheet_pointer.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

TextEditingController numberController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BottomSheetPointer(),
          const SizedBox(height: 15.0),
          TextField(
            onChanged: (value){},
            controller: numberController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("Telefon Numarası"),
                hintText: "5xx xxx xxxx",
                contentPadding: const EdgeInsets.all(10.0),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: skyBlue,
                      width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                )
            ),
          ),
          const SizedBox(height: 15.0),
          TextField(
            onChanged: (value){},
            controller: passwordController,
            textAlign: TextAlign.center,
            maxLength: 10,
            obscureText: true,
            decoration: InputDecoration(
                label: const Text("Parola"),
                hintText: "*********",
                contentPadding: const EdgeInsets.all(10.0),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: skyBlue,
                      width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                )
            ),
          )
        ],
      ),
    );
  }
}