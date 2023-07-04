import 'package:dental_workflow/models/http_response_model.dart';
import 'package:dental_workflow/models/work_model.dart';
import 'package:dental_workflow/providers/work_provider.dart';
import 'package:dental_workflow/styles/button_styles.dart';
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
import 'package:provider/provider.dart';

class CreateWorkPage extends StatefulWidget {
  const CreateWorkPage({Key? key}) : super(key: key);

  @override
  State<CreateWorkPage> createState() => _CreateWorkPageState();
}

class _CreateWorkPageState extends State<CreateWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const CreateWorkHeader(),
                const Divider(),
                const TeethSelection(),
                provider.selectedTeethNumbers.isEmpty ? const SizedBox() :
                Column(
                  children: [
                    MetalTile(provider: provider),
                    Zirkon(provider: provider),
                    Bridge(provider: provider),
                    EMax(provider: provider),
                    Protez(provider: provider),
                    NightPlaque(provider: provider),
                    Temprory(provider: provider),
                    TextButton(onPressed: (){
                      provider.addToModel(WorkModel(
                        workEntities: provider.selectedEntities
                      ));
                      //provider.clearModel();
                      // provider.clearTeethNumber();
                      // provider.selectedEntities.clear();
                    }, style: fullWidthButton, child: const Text("Seçili Dişi Kaydet Ve Devam Et", style: TextStyle(color: Colors.white)))
                  ],
                ),
                DentalTextfield(label: "Müşteri Notu"),
                DentalTextfield(label: "Lab Notu")
              ],
            ),
          ),
        );
      });
  }
}
