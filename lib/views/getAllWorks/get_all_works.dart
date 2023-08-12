import 'package:dental_workflow/models/all_works_model.dart';
import 'package:dental_workflow/models/http_response_model.dart';
import 'package:dental_workflow/services/work_controller.dart';
import 'package:flutter/material.dart';

class GetAllWorks extends StatelessWidget {
  const GetAllWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<HTTPResponse>(
        future: WorkController.getAllWorks(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  print(snapshot.data.data[index]["workEntities"][0]["id"]);
                  return ExpansionTile(
                      title: Text(snapshot.data.data[index]["id"].toString()),
                      children:
                      List.generate(snapshot.data.data[index]["workEntities"].length,
                         (ind) =>
                              WorkTeethDetails(entities: AllWorkEntitiesModel.fromJson(snapshot.data.data[index]["workEntities"][ind])))

                  );
                  //));
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


class WorkTeethDetails extends StatelessWidget {
  const WorkTeethDetails({super.key, required this.entities});
  final AllWorkEntitiesModel entities;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Text("Diş Numarası: ${entities.teethNumber}"),
        entities.workStatus != null ? Text("İş Durumu : ${entities.workStatus}") : const SizedBox(),
        entities.assignedUser !=null ? Text("Atanan Kişi : ${entities.assignedUser}") : const SizedBox(),
        const Text("İşlemler"),
        entities.metal! ? const Text("Metal") : const SizedBox(),
        entities.metalAbove! ? const Text("Metal Üstü") : const SizedBox(),
        entities.metalProva! ? const Text("Metal Prova") : const SizedBox(),
        entities.zirkon! ? const Text("Zirkon") : const SizedBox(),
        entities.zirkonAbove! ? const Text("Zirkon Üstü") : const SizedBox(),
        entities.zirkonProva! ? const Text("Zirkon Prova") : const SizedBox(),
        entities.temp! ? const Text("Geçici") : const SizedBox(),
        entities.nigthPlaque! ?  Text("Gece Plağı: ${entities.hard! ? "Sert" : "Yumuşak"}") : const SizedBox(),
        entities.emax! ? const Text("Emax") : const SizedBox(),
        entities.repair! ? const Text("Onarım") : const SizedBox(),
        entities.protez! ? const Text("Protez") : const SizedBox(),
        entities.bridge! ? const Text("Ara Gövde") : const SizedBox(),
        entities.setBottom! ? const Text("Takım Diş") : const SizedBox(),
        entities.cageBottom! ? const Text("Kafes") : const SizedBox(),
        entities.doldarBar != "" ?  Text("Doldar Bar :  ${entities.doldarBar}") : const SizedBox(),
        entities.doldarFoot != "" ?  Text("Doldar Ayak : ${entities.doldarFoot}") : const SizedBox(),
        entities.customerNote != "" ?  Text("Müşteri Notu: ${entities.customerNote}") : const SizedBox(),
        entities.labNote != "" ? Text("Lab Notu: ${entities.labNote} ") : const SizedBox(),
        entities.slideAmount != 0 ? Text("Sürgü Adedi: ${entities.slideAmount} ") : const SizedBox(),
        entities.kronAmount != 0 ? Text("Kron Adedi: ${entities.kronAmount} ") : const SizedBox(),
        Divider(),
      ],
    );
  }
}

