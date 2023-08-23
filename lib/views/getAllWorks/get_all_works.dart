import 'package:dental_workflow/models/all_works_model.dart';
import 'package:dental_workflow/models/http_response_model.dart';
import 'package:dental_workflow/models/user_model.dart';
import 'package:dental_workflow/services/work_controller.dart';
import 'package:dental_workflow/services/work_status_controller.dart';
import 'package:flutter/material.dart';

import '../users/user_controller.dart';

List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
String selectedMonth = months[DateTime.now().month - 1];

class GetAllWorks extends StatefulWidget {
  const GetAllWorks({super.key});

  @override
  State<GetAllWorks> createState() => _GetAllWorksState();
}

class _GetAllWorksState extends State<GetAllWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<HTTPResponse>(
        future: WorkController.filterOrder("desc"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 70),
                SearchBar(
                  onChanged: (searchValue) {
                    if (searchValue.length > 4) {
                      // WorkController.getByUser(userId, userRole);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          WorkController.filterOrder("desc");
                        },
                        child: const Text("Eskiden Yeniye")),
                    TextButton(
                        onPressed: () {
                          WorkController.filterOrder("asc");
                        },
                        child: const Text("Yeniden Eskiye")),
                    DropdownButton<String>(
                      value: selectedMonth,
                      onChanged: (String? newValue) {
                        WorkController.filterOrderByMonth(
                            months.indexOf(newValue!) + 1);
                        setState(() {
                          selectedMonth = newValue!;
                        });
                      },
                      items:
                          months.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        double totalPrice = 0;
                        for (int i = 0;
                            i <
                                snapshot
                                    .data.data[index]["workEntities"].length;
                            i++) {
                          totalPrice = totalPrice +
                              AllWorkEntitiesModel.fromJson(snapshot
                                      .data.data[index]["workEntities"][i])
                                  .price!
                                  .toDouble();
                        }
                        return ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "${snapshot.data.data[index]["id"].toString()} ${snapshot.data.data[index]["workStatus"].toString()}"),
                                Text("${totalPrice.toString()} ₺")
                              ],
                            ),
                            subtitle: snapshot.data.data[index]["worker"] !=
                                    null
                                ? Text(
                                    "${snapshot.data.data[index]["worker"]["firstName"]} ${snapshot.data.data[index]["worker"]["lastName"]}")
                                : const Text("Boşta"),
                            children: List.generate(
                                snapshot.data.data[index]["workEntities"]
                                    .length, (ind) {
                              return WorkTeethDetails(
                                entities: AllWorkEntitiesModel.fromJson(snapshot
                                    .data.data[index]["workEntities"][ind]),
                                workId: snapshot.data.data[index]["id"],
                              );
                            }));
                        //));
                      }),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class WorkTeethDetails extends StatelessWidget {
  const WorkTeethDetails(
      {super.key, required this.entities, required this.workId});
  final AllWorkEntitiesModel entities;
  final int workId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: FutureBuilder(
                  future: WorkStatusController.getAllStatus(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 600,
                        width: 400,
                        child: ListView.builder(
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(snapshot.data!.data[index]),
                              onTap: () async {
                                await WorkStatusController.updateWorkStatus(
                                        snapshot.data!.data[index], workId)
                                    .then((value) {
                                  if (value.isSuccessful!) {
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Hata")));
                                  }
                                });
                              },
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              );
            }).then((value) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: FutureBuilder(
                    future: UserController.getAllUsers(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 600,
                          width: 400,
                          child: ListView.builder(
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              UserModel user = UserModel.fromJson(
                                  snapshot.data!.data[index]);
                              return ListTile(
                                title:
                                    Text("${user.firstName} ${user.lastName}"),
                                onTap: () async {
                                  await WorkController.assignUser(user, workId)
                                      .then((value) {
                                    if (value.isSuccessful!) {
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text("Hata")));
                                    }
                                  });
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                );
              });
        });
      },
      child: Column(
        children: [
          const Divider(),
          Text("Diş Numarası: ${entities.teethNumber}"),
          entities.workStatus != null
              ? Text("İş Durumu : ${entities.workStatus}")
              : const SizedBox(),
          entities.assignedUser != null
              ? Text("Atanan Kişi : ${entities.assignedUser}")
              : const SizedBox(),
          const Text("İşlemler"),
          entities.metal! ? const Text("Metal") : const SizedBox(),
          entities.metalAbove! ? const Text("Metal Üstü") : const SizedBox(),
          entities.metalProva! ? const Text("Metal Prova") : const SizedBox(),
          entities.zirkon! ? const Text("Zirkon") : const SizedBox(),
          entities.zirkonAbove! ? const Text("Zirkon Üstü") : const SizedBox(),
          entities.zirkonProva! ? const Text("Zirkon Prova") : const SizedBox(),
          entities.temp! ? const Text("Geçici") : const SizedBox(),
          entities.nigthPlaque!
              ? Text("Gece Plağı: ${entities.hard! ? "Sert" : "Yumuşak"}")
              : const SizedBox(),
          entities.emax! ? const Text("Emax") : const SizedBox(),
          entities.repair! ? const Text("Onarım") : const SizedBox(),
          entities.protez! ? const Text("Protez") : const SizedBox(),
          entities.bridge! ? const Text("Ara Gövde") : const SizedBox(),
          entities.setBottom! ? const Text("Takım Diş") : const SizedBox(),
          entities.cageBottom! ? const Text("Kafes") : const SizedBox(),
          entities.doldarBar != ""
              ? Text("Doldar Bar :  ${entities.doldarBar}")
              : const SizedBox(),
          entities.doldarFoot != ""
              ? Text("Doldar Ayak : ${entities.doldarFoot}")
              : const SizedBox(),
          entities.customerNote != ""
              ? Text("Müşteri Notu: ${entities.customerNote}")
              : const SizedBox(),
          entities.labNote != ""
              ? Text("Lab Notu: ${entities.labNote} ")
              : const SizedBox(),
          entities.slideAmount != 0
              ? Text("Sürgü Adedi: ${entities.slideAmount} ")
              : const SizedBox(),
          entities.kronAmount != 0
              ? Text("Kron Adedi: ${entities.kronAmount} ")
              : const SizedBox(),
          const Divider(),
        ],
      ),
    );
  }
}
