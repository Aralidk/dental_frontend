import 'package:flutter/material.dart';

class NoPermissionPage extends StatelessWidget {
  const NoPermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Center(
          child: Text(
              "Kaydınız beklemede, gün içerisinde onaylanmaz ise lütfen yönetim ile iletişime geçin.")),
    );
  }
}
