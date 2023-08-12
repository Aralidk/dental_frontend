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
    data['id'] = id;
    if (workEntities != null) {
      data['workEntities'] = workEntities!.map((v) => v.toJson()).toList();
    }
    data['worker'] = worker;
    return data;
  }
}

class AllWorkEntitiesModel{
  int? id;
  int? teethNumber;
  int? slideAmount;
  int? kronAmount;
  String? doldarBar;
  String? doldarFoot;
  String? customerNote;
  String? labNote;
  String? assignedUser;
  String? workStatus;
  bool? bridge;
  bool? metal;
  bool? metalAbove;
  bool? metalProva;
  bool? zirkon;
  bool? zirkonAbove;
  bool? zirkonProva;
  bool? emax;
  bool? temp;
  bool? nigthPlaque;
  bool? hard;
  bool? protez;
  bool? repair;
  bool? setBottom;
  bool? cageBottom;

  AllWorkEntitiesModel(
  {this.id,
  this.teethNumber,
  this.slideAmount,
  this.kronAmount,
  this.doldarBar,
  this.doldarFoot,
  this.customerNote,
  this.labNote,
  this.assignedUser,
  this.workStatus,
  this.bridge,
  this.metal,
  this.metalAbove,
  this.metalProva,
  this.zirkon,
  this.zirkonAbove,
  this.zirkonProva,
  this.emax,
  this.temp,
  this.nigthPlaque,
  this.hard,
  this.protez,
  this.repair,
  this.setBottom,
  this.cageBottom});

  AllWorkEntitiesModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  teethNumber = json['teethNumber'];
  slideAmount = json['slideAmount'];
  kronAmount = json['kronAmount'];
  doldarBar = json['doldarBar'];
  doldarFoot = json['doldarFoot'];
  customerNote = json['customerNote'];
  labNote = json['labNote'];
  assignedUser = json['assignedUser'];
  workStatus = json['workStatus'];
  bridge = json['bridge'];
  metal = json['metal'];
  metalAbove = json['metalAbove'];
  metalProva = json['metalProva'];
  zirkon = json['zirkon'];
  zirkonAbove = json['zirkonAbove'];
  zirkonProva = json['zirkonProva'];
  emax = json['emax'];
  temp = json['temp'];
  nigthPlaque = json['nigthPlaque'];
  hard = json['hard'];
  protez = json['protez'];
  repair = json['repair'];
  setBottom = json['setBottom'];
  cageBottom = json['cageBottom'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = id;
  data['teethNumber'] = teethNumber;
  data['slideAmount'] = slideAmount;
  data['kronAmount'] = kronAmount;
  data['doldarBar'] = doldarBar;
  data['doldarFoot'] = doldarFoot;
  data['customerNote'] = customerNote;
  data['labNote'] = labNote;
  data['assignedUser'] = assignedUser;
  data['workStatus'] = workStatus;
  data['bridge'] = bridge;
  data['metal'] = metal;
  data['metalAbove'] = metalAbove;
  data['metalProva'] = metalProva;
  data['zirkon'] = zirkon;
  data['zirkonAbove'] = zirkonAbove;
  data['zirkonProva'] = zirkonProva;
  data['emax'] = emax;
  data['temp'] = temp;
  data['nigthPlaque'] = nigthPlaque;
  data['hard'] = hard;
  data['protez'] = protez;
  data['repair'] = repair;
  data['setBottom'] = setBottom;
  data['cageBottom'] = cageBottom;
  return data;
  }

}

