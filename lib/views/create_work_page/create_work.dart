import 'package:dental_workflow/constants/colors.dart';
import 'package:dental_workflow/models/work_model.dart';
import 'package:dental_workflow/providers/app_state_provider.dart';
import 'package:dental_workflow/providers/work_provider.dart';
import 'package:dental_workflow/styles/button_styles.dart';
import 'package:dental_workflow/views/create_work_page/widgets/bridge.dart';
import 'package:dental_workflow/views/create_work_page/widgets/creatework_header.dart';
import 'package:dental_workflow/views/create_work_page/widgets/emax.dart';
import 'package:dental_workflow/views/create_work_page/widgets/metal_feature.dart';
import 'package:dental_workflow/views/create_work_page/widgets/protez.dart';
import 'package:dental_workflow/views/create_work_page/widgets/teeth_selection.dart';
import 'package:dental_workflow/views/create_work_page/widgets/temprory.dart';
import 'package:dental_workflow/views/create_work_page/widgets/zirkon.dart';
import 'package:dental_workflow/widgets/dental_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/work_controller.dart';

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
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    provider.addEntityToModel();
                    print("asdsa");
                  },
                  style: fullWidthButton,
                  child: const Text("Seçili Dişleri Onayla",
                      style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Prova"),
                        Switch(
                            value: provider.isProva,
                            onChanged: (val) {
                              provider.changeProva(val);
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Gece Plağı"),
                        Switch(
                            value:
                                provider.nightPlaqueDetails.values.elementAt(0),
                            onChanged: (val) {
                              if (val) {
                                provider.changeNigthPlaque(
                                    'isNigthPlaque', val);
                              } else {
                                provider.changeNigthPlaque(
                                    'isNigthPlaque', false);
                                provider.changeNigthPlaque('isSoft', false);
                                provider.changeNigthPlaque('isHard', false);
                              }
                            }),
                      ],
                    ),
                  ),
                  provider.nightPlaqueDetails.values.elementAt(0)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  activeColor: dentalBlue,
                                  checkColor: dentalBlue,
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  value: provider.nightPlaqueDetails.values
                                      .elementAt(1),
                                  onChanged: (val) {
                                    provider.changeNigthPlaque('isHard', val!);
                                    provider.changeNigthPlaque('isSoft', false);
                                  },
                                  title: const Text("Sert"),
                                ),
                              ),
                              Expanded(
                                child: CheckboxListTile(
                                  value: provider.nightPlaqueDetails.values
                                      .elementAt(2),
                                  activeColor: dentalBlue,
                                  checkColor: dentalBlue,
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  onChanged: (val) {
                                    provider.changeNigthPlaque('isSoft', val!);
                                    provider.changeNigthPlaque('isHard', false);
                                  },
                                  title: const Text("Yumuşak"),
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                  Protez(provider: provider),
                  // NightPlaque(provider: provider),
                  MetalTile(provider: provider),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: provider.type.values.elementAt(5),
                    activeColor: dentalBlue,
                    onChanged: (val) {
                      provider.changeOperationType(val!, 'isMetAbove');
                    },
                    tristate: false,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    checkColor: dentalBlue,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    title: const Text("İmplant Üstü Metal"),
                  ),
                  Zirkon(provider: provider),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: provider.type.values.elementAt(6),
                    activeColor: dentalBlue,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    onChanged: (val) {
                      provider.changeOperationType(val!, 'isZirAbove');
                    },
                    checkColor: dentalBlue,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    title: const Text("Zirkon Üstü"),
                  ),
                  Bridge(provider: provider),
                  EMax(provider: provider),
                  Temprory(provider: provider),
                ],
              ),
              DentalTextfield(
                  label: "Müşteri Notu",
                  onChange: (val) {
                    provider.changeCustomerNote(val);
                  }),
              DentalTextfield(
                  label: "Lab Notu",
                  onChange: (val) {
                    provider.changeCustomerNote(val);
                  }),
              TextButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    String token =   preferences.getString('token')!;
                    if(provider.isProtez) {
                      provider.workModels.workEntities!.add(WorkEntities(
                          isProtez: true,
                          slideAmount: provider.protezDetails.values.elementAt(
                              0),
                          kronAmount: provider.protezDetails.values.elementAt(
                              1),
                          isRepair: provider.protezDetails.values.elementAt(2),
                          isSetBottom: provider.protezDetails.values.elementAt(
                              3),
                          isCageBottom: provider.protezDetails.values.elementAt(
                              4),
                          doldarBar: provider.protezDetails.values.elementAt(5),
                          doldarFoot: provider.protezDetails.values.elementAt(6)
                      ));
                    }
                    if(provider.isNigthPlaque){
                      provider.workModels.workEntities!.add(WorkEntities(
                          isNigthPlaque: provider.nightPlaqueDetails.values.elementAt(
                              0),
                          isHard: provider.nightPlaqueDetails.values.elementAt(
                              1),
                      ));
                    }
                      WorkController.createWork(provider.workModels,
                            token)
                        .then((value) {
                      if (value.isSuccessful!) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("İş Kaydedildi")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Hata Oluştu")));
                      }
                    });
                    print(provider.workModels.workEntities!.length);
                    },
                  style: fullWidthButton,
                  child: const Text("Kaydet",
                      style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      );
    });
  }
}
