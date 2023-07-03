import 'package:dental_workflow/providers/app_state_provider.dart';
import 'package:dental_workflow/styles/button_styles.dart';
import 'package:dental_workflow/widgets/bottom_sheet_pointer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import '../../../constants/colors.dart';

TextEditingController emailController = TextEditingController();
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
            onChanged: (value) {},
            controller: emailController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("E-posta"),
                hintText: "xxxxx@gmail.com",
                contentPadding: const EdgeInsets.all(10.0),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: skyBlue, width: 1.0),
                  borderRadius: BorderRadius.circular(18.0),
                )),
          ),
          const SizedBox(height: 15.0),
          TextField(
            onChanged: (value) {},
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
                  borderSide: BorderSide(color: skyBlue, width: 1.0),
                  borderRadius: BorderRadius.circular(18.0),
                )),
          ),
          TextButton(
              onPressed: () {
                Provider.of<AppStateProvider>(context, listen: false)
                    .userLog(emailController.text, passwordController.text)
                    .then(((response) {
                  if (response) {
                    Routemaster.of(context).push("/homePage");
                  } else {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Hatalı giriş yaptınız, bilgilerinizi tekrar kontrol ediniz.")));
                  }
                }));
              },
              style: blueButton,
              child:
                  const Text("Kaydet", style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
