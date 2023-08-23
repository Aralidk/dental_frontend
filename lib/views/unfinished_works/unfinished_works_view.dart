
import 'package:dental_workflow/services/work_controller.dart';
import 'package:flutter/material.dart';

class UnfinishedWorksView extends StatelessWidget {
  const UnfinishedWorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: WorkController.getNotDelivered(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData){
          return Text("succes");
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      },),
    );
  }
}
