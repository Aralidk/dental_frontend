import 'package:dental_workflow/models/work_model.dart';

class AllWorks {
  int? id;
  List<WorkEntities>? workEntities;
  String? worker;

  AllWorks({this.id, this.workEntities, this.worker});

  AllWorks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['workEntities'] != null) {
      workEntities = <WorkEntities>[];
      json['workEntities'].forEach((v) {
        workEntities!.add(WorkEntities.fromJson(v));
      });
    }
    worker = json['worker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    if (this.workEntities != null) {
      data['workEntities'] = this.workEntities!.map((v) => v.toJson()).toList();
    }
    data['worker'] = this.worker;
    return data;
  }
}


