import 'package:dental_workflow/models/all_works_model.dart';
import 'package:dental_workflow/models/work_model.dart';
import 'package:dental_workflow/services/work_controller.dart';
import 'package:flutter/material.dart';

class GetAllWorks extends StatelessWidget {
  const GetAllWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: WorkController.getAllWorks(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData) {
            AllWorks allWorks = AllWorks.fromJson(snapshot.data.data[0]);
            return ListView.builder(
              itemCount: allWorks.workEntities?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                 WorkEntities workEntities = allWorks.workEntities![index];
                  return Center(child: Text(workEntities.id.toString()));
                });
          }
          else{
            return const Center(child:  CircularProgressIndicator());
          }
          },),
    );
  }
}
