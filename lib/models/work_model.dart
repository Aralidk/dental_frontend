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
  int? id;
  int? teethNumber;
  bool? isMetal;
  bool? isMetalAbove;
  bool? isMetalProva;
  bool? isZirkon;
  bool? isZirkonAbove;
  bool? isZirkonProva;
  bool? isBridge;
  bool? isEMax;
  bool? isTemp;
  bool? isNigthPlaque;
  bool? isHard;
  bool? isProtez;
  int? slideAmount;
  int? kronAmount;
  bool? isRepair;
  bool? isSetBottom;
  bool? isCageBottom;
  String? doldarBar;
  String? doldarFoot;
  String? customerNote;
  String? labNote;

  WorkEntities(
      {this.id,
        this.teethNumber,
        this.isMetal,
        this.isMetalAbove,
        this.isMetalProva,
        this.isZirkon,
        this.isZirkonAbove,
        this.isZirkonProva,
        this.isBridge,
        this.isEMax,
        this.isTemp,
        this.isNigthPlaque,
        this.isHard,
        this.isProtez,
        this.slideAmount,
        this.kronAmount,
        this.isRepair,
        this.isSetBottom,
        this.isCageBottom,
        this.doldarBar,
        this.doldarFoot,
        this.customerNote,
        this.labNote});

  WorkEntities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teethNumber = json['teethNumber'];
    isMetal = json['isMetal'];
    isMetalAbove = json['isMetalAbove'];
    isMetalProva = json['isMetalProva'];
    isZirkon = json['isZirkon'];
    isZirkonAbove = json['isZirkonAbove'];
    isZirkonProva = json['isZirkonProva'];
    isBridge = json['isBridge'];
    isEMax = json['isEMax'];
    isTemp = json['isTemp'];
    isNigthPlaque = json['isNigthPlaque'];
    isHard = json['isHard'];
    isProtez = json['isProtez'];
    slideAmount = json['slideAmount'];
    kronAmount = json['kronAmount'];
    isRepair = json['isRepair'];
    isSetBottom = json['isSetBottom'];
    isCageBottom = json['isCageBottom'];
    doldarBar = json['doldarBar'];
    doldarFoot = json['doldarFoot'];
    customerNote = json['customerNote'];
    labNote = json['labNote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teethNumber'] = teethNumber;
    data['isMetal'] = isMetal;
    data['isMetalAbove'] = isMetalAbove;
    data['isMetalProva'] = isMetalProva;
    data['isZirkon'] = isZirkon;
    data['isZirkonAbove'] = isZirkonAbove;
    data['isZirkonProva'] = isZirkonProva;
    data['isBridge'] = isBridge;
    data['isEMax'] = isEMax;
    data['isTemp'] = isTemp;
    data['isNigthPlaque'] = isNigthPlaque;
    data['isHard'] = isHard;
    data['isProtez'] = isProtez;
    data['slideAmount'] = slideAmount;
    data['kronAmount'] = kronAmount;
    data['isRepair'] = isRepair;
    data['isSetBottom'] = isSetBottom;
    data['isCageBottom'] = isCageBottom;
    data['doldarBar'] = doldarBar;
    data['doldarFoot'] = doldarFoot;
    data['customerNote'] = customerNote;
    data['labNote'] = labNote;
    return data;
  }
}