import 'package:flutter/material.dart';

import '../models/work_model.dart';

class WorkProvider extends ChangeNotifier {
  WorkModel workModels = WorkModel(workEntities: []);
  List<int> selectedTeethNumbers = [];
  List<WorkEntities> selectedEntities = [];
  bool allSelected = false;
  List<WorkEntities> selectedMetal = [];
  List<WorkEntities> selectedZirkon = [];
  List<WorkEntities> selectedEmax = [];
  bool isProtez = false;
  bool isNigthPlaque = false;
  bool isProva = false;
  List<WorkEntities> selectedTemp = [];
  List<WorkEntities> selectedBridge = [];
  List<WorkEntities> implantAbove = [];
  List<WorkEntities> zirkonAbove = [];
  String labNote = "";
  String customerNote = "";
  Map<String, dynamic> type = {
    'isMetal': false,
    'isZirkon': false,
    'isEmax': false,
    'isBridge': false,
    'isTemp': false,
    'isMetAbove': false,
    'isZirAbove': false
  };

  Map<String, dynamic> protezDetails = {
    "slideAmount": 0,
    "kronAmount": 0,
    "isRepair": false,
    "isSetBottom": null,
    "isCageBottom": null,
    "doldarBar": null,
    "doldarFoot": null,
  };

  Map<String, dynamic> nightPlaqueDetails = {
    "isNigthPlaque": false,
    "isHard": false,
    "isSoft": false,
  };

  changeOperationType(bool val, String t) {
    type.updateAll((key, value) => false);
    type.update(t, (value) => val);
    if (!val) {
      selectedMetal.clear();
      selectedBridge.clear();
      selectedTemp.clear();
      selectedEmax.clear();
      selectedZirkon.clear();
      implantAbove.clear();
    }
    notifyListeners();
  }

  changeProtez(bool value) {
    isProtez = value;
    notifyListeners();
  }

  changeNigthPlaque(String key, bool val) {
    nightPlaqueDetails.update(key, (value) => val);
    notifyListeners();
  }

  changeProva(bool val) {
    isProva = val;
    notifyListeners();
  }

  addEntityToModel() {
    if (selectedMetal.isNotEmpty) {
        workModels.workEntities?.addAll(selectedMetal);
      selectedMetal.clear();
    } else if (selectedTemp.isNotEmpty) {
      workModels.workEntities?.addAll(selectedTemp);
      selectedTemp.clear();
    } else if (selectedBridge.isNotEmpty) {
      workModels.workEntities?.addAll(selectedBridge);
      selectedBridge.clear();
    } else if (selectedZirkon.isNotEmpty) {
        workModels.workEntities?.addAll(selectedZirkon);
      selectedZirkon.clear();
    } else if (selectedEmax.isNotEmpty) {
      workModels.workEntities?.addAll(selectedEmax);
      selectedEmax.clear();
    } else if (implantAbove.isNotEmpty) {
      workModels.workEntities?.addAll(implantAbove);
      implantAbove.clear();
    } else if (zirkonAbove.isNotEmpty) {
      workModels.workEntities?.addAll(zirkonAbove);
      zirkonAbove.clear();
    }
    notifyListeners();
  }

  addToEntityEnt(teethNumber) {
    if (type.values.elementAt(0)) {
      if (selectedMetal.any((element) => element.teethNumber == teethNumber)) {
        selectedMetal
            .removeWhere((element) => element.teethNumber == teethNumber);
      } else {
        selectedMetal
            .add(WorkEntities(teethNumber: teethNumber, isMetal: true, id:  DateTime.now().microsecondsSinceEpoch.toInt()));
      }
    } else if (type.values.elementAt(1)) {
      if (selectedZirkon.any((element) => element.teethNumber == teethNumber)) {
        selectedZirkon
            .removeWhere((element) => element.teethNumber == teethNumber);
      } else {
        selectedZirkon
            .add(WorkEntities(teethNumber: teethNumber, isZirkon: true, id:  DateTime.now().microsecondsSinceEpoch.toInt()));
      }
    } else if (type.values.elementAt(2)) {
      if (selectedEmax.any((element) => element.teethNumber == teethNumber)) {
        selectedEmax
            .removeWhere((element) => element.teethNumber == teethNumber);
      } else {
        selectedEmax.add(WorkEntities(teethNumber: teethNumber, isEMax: true, id:  DateTime.now().microsecondsSinceEpoch.toInt()));
      }
    } else if (type.values.elementAt(3)) {
      if (selectedBridge.any((element) => element.teethNumber == teethNumber)) {
        selectedBridge
            .removeWhere((element) => element.teethNumber == teethNumber);
      } else {
        selectedBridge
            .add(WorkEntities(teethNumber: teethNumber, isBridge: true, id:  DateTime.now().microsecondsSinceEpoch.toInt()));
      }
    } else if (type.values.elementAt(4)) {
      if (selectedTemp.any((element) => element.teethNumber == teethNumber)) {
        selectedTemp
            .removeWhere((element) => element.teethNumber == teethNumber);
      } else {
        selectedTemp.add(WorkEntities(teethNumber: teethNumber, isTemp: true, id:  DateTime.now().microsecondsSinceEpoch.toInt()));
      }
    } else if (type.values.elementAt(5)) {
      if (implantAbove.any((element) => element.teethNumber == teethNumber)) {
        implantAbove
            .removeWhere((element) => element.teethNumber == teethNumber);
      } else {
        implantAbove
            .add(WorkEntities(teethNumber: teethNumber, isMetalAbove: true,  id:  DateTime.now().microsecondsSinceEpoch.toInt()));
      }
    } else if (type.values.elementAt(6)) {
      if (zirkonAbove.any((element) => element.teethNumber == teethNumber)) {
        zirkonAbove
            .removeWhere((element) => element.teethNumber == teethNumber);
      } else {
        zirkonAbove
            .add(WorkEntities(teethNumber: teethNumber, isMetalAbove: true, id:  DateTime.now().microsecondsSinceEpoch.toInt()));
      }
    }
    notifyListeners();
  }

  changeLabNote(String val) {
    labNote = val;
    notifyListeners();
  }

  changeCustomerNote(String val) {
    customerNote = val;
    notifyListeners();
  }

  // addToModel(WorkModel model) {
  //   if (!workModels.contains(model) && workModels.where((element) => element.workEntities == model.workEntities).isEmpty) {
  //    print("aaaaaaaaaaaaaaaaaaa");
  //     workModels.add(model);
  //   }
  //   notifyListeners();
  // }
  //
  // clearModel() {
  //   workModels.clear();
  //   notifyListeners();
  // }
  //
  // clearTeethNumber() {
  //   selectedTeethNumbers.clear();
  //   notifyListeners();
  // }
  //
  // setAllSelected(bool val){
  //   allSelected = val;
  //   notifyListeners();
  // }
  //
  // selectTeethNumber(int teethNumber, WorkEntities entities) {
  //   selectedTeethNumbers.add(teethNumber);
  //   selectedEntities.add(entities);
  //   print(selectedEntities);
  //   notifyListeners();
  // }
  //
  // selectedWorkModelMetalUpdate(
  //     {List<int>? teethNumbers,bool? isMetal, bool? isMetalAbove, bool? isMetalProva}
  //     ) {
  //   for(int i = 0; i<teethNumbers!.length; i++){
  //     selectedEntities[i].isMetal = isMetal;
  //     selectedEntities[i].isMetalProva = isMetalProva;
  //     selectedEntities[i].isMetalAbove = isMetalAbove;
  //   }
  //   notifyListeners();
  // }
  //
  // selectedWorkModelZirkonUpdate(
  // {List<int>? teethNumbers, bool? isZirkon, bool? isZirkonAbove, bool? isZirkonProva}) {
  //   for(int i = 0; i<teethNumbers!.length; i++){
  //     selectedEntities[i].isZirkon = isZirkon;
  //     selectedEntities[i].isZirkonProva = isZirkonProva;
  //     selectedEntities[i].isZirkonAbove = isZirkonAbove;
  //   }
  //   notifyListeners();
  // }
  //
  // selectedWorkModelBridgeUpdate({List<int>? teethNumbers,bool? isBridge}) {
  //   for(int i = 0; i<teethNumbers!.length; i++){
  //     selectedEntities[i].isBridge = isBridge;
  //   }
  //   notifyListeners();
  // }
  //
  // selectedWorkModelEmaxUpdate({List<int>? teethNumbers,bool? isEmax}) {
  //   for(int i = 0; i<teethNumbers!.length; i++){
  //     selectedEntities[i].isEMax = isEmax;
  //   }
  //   notifyListeners();
  // }
  //
  // selectedWorkModelTempUpdate({List<int>? teethNumbers,bool? isTemp}) {
  //   for(int i = 0; i<teethNumbers!.length; i++){
  //     selectedEntities[i].isTemp = isTemp;
  //   }
  //   notifyListeners();
  // }
  //
  // selectedWorkModelNightPlaqueUpdate({List<int>? teethNumbers,bool? isNightPlaque}) {
  //   for(int i = 0; i<teethNumbers!.length; i++){
  //     selectedEntities[i].isNigthPlaque = isNightPlaque;
  //   }
  //   notifyListeners();
  // }
  //
  // selectedWorkModelNightPlaqueTypeUpdate({List<int>? teethNumbers,bool? isHard}) {
  //   for(int i = 0; i<teethNumbers!.length; i++){
  //     selectedEntities[i].isHard = isHard;
  //   }
  //   notifyListeners();
  // }
  //
  selectedWorkModelProtezUpdate(String key, dynamic val) {
    protezDetails.update(key, (value) => val);
    notifyListeners();
  }
}
