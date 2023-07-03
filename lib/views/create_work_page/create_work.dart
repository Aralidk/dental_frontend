import 'package:dental_workflow/models/http_response_model.dart';
import 'package:dental_workflow/views/create_work_page/widgets/bridge.dart';
import 'package:dental_workflow/views/create_work_page/widgets/creatework_header.dart';
import 'package:dental_workflow/views/create_work_page/widgets/emax.dart';
import 'package:dental_workflow/views/create_work_page/widgets/metal_feature.dart';
import 'package:dental_workflow/views/create_work_page/widgets/night_plaque.dart';
import 'package:dental_workflow/views/create_work_page/widgets/protez.dart';
import 'package:dental_workflow/views/create_work_page/widgets/teeth_selection.dart';
import 'package:dental_workflow/views/create_work_page/widgets/temprory.dart';
import 'package:dental_workflow/views/create_work_page/widgets/zirkon.dart';
import 'package:dental_workflow/widgets/dental_textfield.dart';
import 'package:flutter/material.dart';

class CreateWorkPage extends StatefulWidget {
  const CreateWorkPage({Key? key}) : super(key: key);

  @override
  State<CreateWorkPage> createState() => _CreateWorkPageState();
}

class _CreateWorkPageState extends State<CreateWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const CreateWorkHeader(),
            const Divider(),
            const TeethSelection(),
            const MetalTile(),
            const Zirkon(),
            const Bridge(),
            const EMax(),
            const Protez(),
            const NightPlaque(),
            const Temprory(),
            DentalTextfield(label: "Müşteri Notu"),
            DentalTextfield(label: "Lab Notu")
          ],
        ),
      ),
    );
  }
}
