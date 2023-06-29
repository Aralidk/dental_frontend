import 'package:dental_workflow/styles/button_styles.dart';
import 'package:dental_workflow/styles/text_styles.dart';
import 'package:dental_workflow/views/login_page/widgets/login_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'widgets/register_bottomsheet.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white54,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset("assets/opening.png", width: 500),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      constraints:
                          const BoxConstraints(minHeight: 250, maxHeight: 600),
                      context: context,
                      builder: (BuildContext context) {
                        return const LoginBottomSheet();
                      },
                    );
                  },
                  style: blueButton,
                  child: Text("Giriş Yap", style: buttonText)),
              const SizedBox(height: 15.0),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      constraints:
                          const BoxConstraints(minHeight: 250, maxHeight: 600),
                      context: context,
                      builder: (BuildContext context) {
                        return const RegisterBottomSheet();
                      },
                    );
                  },
                  style: blueButton,
                  child: Text("Kayıt Ol", style: buttonText)),
            ],
          ),
        ),
      ),
    );
  }
}
