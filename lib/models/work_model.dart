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
  int? id = 0;
  int? teethNumber = 0;
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
      {this.id = 0,
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
        this.labNote = ""});

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