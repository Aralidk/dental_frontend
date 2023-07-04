import 'package:flutter/material.dart';

import '../models/work_model.dart';

class WorkProvider extends ChangeNotifier {
  List<WorkModel> workModels = [];
  List<int> selectedTeethNumbers = [];
  List<WorkEntities> selectedEntities = [];

  addToModel(WorkModel model) {
    if (!workModels.contains(model) && workModels.where((element) => element.workEntities == model.workEntities).isEmpty) {
      workModels.add(model);

    }
    notifyListeners();
  }

  clearModel() {
    workModels.clear();
    notifyListeners();
  }

  clearTeethNumber() {
    selectedTeethNumbers.clear();
    notifyListeners();
  }

  selectTeethNumber(int teethNumber, WorkEntities entities) {
    selectedTeethNumbers.add(teethNumber);
    selectedEntities.add(entities);
    print(selectedEntities);
    notifyListeners();
  }

  selectedWorkModelMetalUpdate(
      {List<int>? teethNumbers,bool? isMetal, bool? isMetalAbove, bool? isMetalProva}
      ) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isMetal = isMetal;
      selectedEntities[i].isMetalProva = isMetalProva;
      selectedEntities[i].isMetalAbove = isMetalAbove;
    }
    notifyListeners();
  }

  selectedWorkModelZirkonUpdate(
  {List<int>? teethNumbers, bool? isZirkon, bool? isZirkonAbove, bool? isZirkonProva}) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isZirkon = isZirkon;
      selectedEntities[i].isZirkonProva = isZirkonProva;
      selectedEntities[i].isZirkonAbove = isZirkonAbove;
    }
    notifyListeners();
  }

  selectedWorkModelBridgeUpdate({List<int>? teethNumbers,bool? isBridge}) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isBridge = isBridge;
    }
    notifyListeners();
  }

  selectedWorkModelEmaxUpdate({List<int>? teethNumbers,bool? isEmax}) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isEMax = isEmax;
    }
    notifyListeners();
  }

  selectedWorkModelTempUpdate({List<int>? teethNumbers,bool? isTemp}) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isTemp = isTemp;
    }
    notifyListeners();
  }

  selectedWorkModelNightPlaqueUpdate({List<int>? teethNumbers,bool? isNightPlaque}) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isNigthPlaque = isNightPlaque;
    }
    notifyListeners();
  }

  selectedWorkModelNightPlaqueTypeUpdate({List<int>? teethNumbers,bool? isHard}) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isHard = isHard;
    }
    notifyListeners();
  }

  selectedWorkModelProtezUpdate(
      {List<int>? teethNumbers,bool? isProtez,
      int? slideAmount,
      int? kronAmount,
      bool? isRepair,
      bool? isSetBottom,
      bool? isCageBottom,
      String? doldarBar,
      String? doldarFoot}) {
    for(int i = 0; i<teethNumbers!.length; i++){
      selectedEntities[i].isProtez = isProtez;
      selectedEntities[i].slideAmount = slideAmount;
      selectedEntities[i].kronAmount = kronAmount;
      selectedEntities[i].isRepair = isRepair;
      selectedEntities[i].isSetBottom = isSetBottom;
      selectedEntities[i].isCageBottom = isCageBottom;
      selectedEntities[i].doldarFoot = doldarFoot;
      selectedEntities[i].doldarBar = doldarBar;
    }
    notifyListeners();
  }
}
