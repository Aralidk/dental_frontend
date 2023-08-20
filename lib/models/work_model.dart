import 'package:flutter/foundation.dart';

class WorkModel {
  List<WorkEntities>? workEntities;

  WorkModel({this.workEntities});

  WorkModel.fromJson(Map<String, dynamic> json) {
    if (json['workEntities'] != null) {
      workEntities = <WorkEntities>[];
      json['workEntities'].forEach((v) {
        workEntities!.add(WorkEntities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (workEntities != null) {
      data['workEntities'] = workEntities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkEntities {
  int id =0;
  int? teethNumber = 0;
  String? assignedUser;
  String? workStatus;
  bool? isMetal = false;
  bool? isMetalAbove = false;
  bool? isMetalProva = false;
  bool? isZirkon = false;
  bool? isZirkonAbove = false;
  bool? isZirkonProva =false;
  bool? isBridge = false;
  bool? isEMax = false;
  bool? isTemp = false;
  bool? isNigthPlaque = false;
  bool? isHard = false;
  bool? isProtez = false;
  int? slideAmount = 0;
  int? kronAmount = 0;
  bool? isRepair = false;
  bool? isSetBottom = false;
  bool? isCageBottom = false;
  String? doldarBar = "";
  String? doldarFoot = "";
  String? customerNote = "";
  String? labNote = "";

  WorkEntities(
      {
        this.id = 0,
        this.teethNumber = 0,
        this.isMetal = false,
        this.isMetalAbove  = false,
        this.isMetalProva  = false,
        this.isZirkon  = false,
        this.isZirkonAbove  = false,
        this.isZirkonProva  = false,
        this.isBridge  = false,
        this.isEMax  = false,
        this.isTemp  = false,
        this.isNigthPlaque  = false,
        this.isHard  = false,
        this.isProtez  = false,
        this.slideAmount  = 0,
        this.kronAmount  = 0,
        this.isRepair  = false,
        this.isSetBottom  = false,
        this.isCageBottom  = false,
        this.doldarBar  ="",
        this.doldarFoot ="",
        this.customerNote = "",
        this.assignedUser,
        this.workStatus,
        this.labNote = ""});

  WorkEntities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teethNumber = json['teethNumber'];
    isMetal = json['metal'];
    isMetalAbove = json['metalAbove'];
    isMetalProva = json['metalProva'];
    isZirkon = json['zirkon'];
    isZirkonAbove = json['zirkonAbove'];
    isZirkonProva = json['zirkonProva'];
    isBridge = json['bridge'];
    isEMax = json['EMax'];
    isTemp = json['temp'];
    isNigthPlaque = json['nigthPlaque'];
    isHard = json['hard'];
    isProtez = json['protez'];
    slideAmount = json['slideAmount'];
    kronAmount = json['kronAmount'];
    isRepair = json['repair'];
    isSetBottom = json['setBottom'];
    isCageBottom = json['cageBottom'];
    doldarBar = json['doldarBar'];
    doldarFoot = json['doldarFoot'];
    customerNote = json['customerNote'];
    labNote = json['labNote'];
    assignedUser = json["assignedUser"];
    workStatus = json["workStatus"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teethNumber'] = teethNumber;
    data['metal'] = isMetal;
    data['metalAbove'] = isMetalAbove;
    data['metalProva'] = isMetalProva;
    data['zirkon'] = isZirkon;
    data['zirkonAbove'] = isZirkonAbove;
    data['zirkonProva'] = isZirkonProva;
    data['bridge'] = isBridge;
    data['EMax'] = isEMax;
    data['temp'] = isTemp;
    data['nigthPlaque'] = isNigthPlaque;
    data['hard'] = isHard;
    data['protez'] = isProtez;
    data['slideAmount'] = slideAmount;
    data['kronAmount'] = kronAmount;
    data['repair'] = isRepair;
    data['setBottom'] = isSetBottom;
    data['cageBottom'] = isCageBottom;
    data['doldarBar'] = doldarBar;
    data['doldarFoot'] = doldarFoot;
    data['customerNote'] = customerNote;
    data['labNote'] = labNote;
    data["assignedUser"] = assignedUser;
    data["workStatus"] = workStatus;
    return data;
  }
}