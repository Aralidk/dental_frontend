import 'package:dental_workflow/services/register_controller.dart';
import 'package:dental_workflow/widgets/bottom_sheet_pointer.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../../../constants/colors.dart';
import '../../../styles/button_styles.dart';

TextEditingController mailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController departmentController = TextEditingController();

class RegisterBottomSheet extends StatelessWidget {
  const RegisterBottomSheet({Key? key}) : super(key: key);

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
            controller: mailController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("E-Posta Adresi"),
                hintText: "xxxxx@mail.com",
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
            controller: nameController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("İsim"),
                hintText: "Ali...",
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
            controller: surnameController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("Soyisim"),
                hintText: "Ender...",
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
            controller: departmentController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: const Text("Çalışma Alanı"),
                hintText: "Protez",
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
          const SizedBox(height: 15.0),
          TextButton(
              onPressed: () {
                RegisterController.Register(
                        mailController.text,
                        nameController.text,
                        surnameController.text,
                        departmentController.text,
                        passwordController.text)
                    .then((response) {
                  if (response.statusCode == 200) {
                    // Navigator.pop(context);
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text("Kaydınız Başarıyla Oluşturuldu")));
                    Routemaster.of(context).push("/homePage");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Hata Oluştu")));
                  }
                });
              },
              style: blueButton,
              child:
                  const Text("Kaydet", style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
