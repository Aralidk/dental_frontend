import 'package:flutter/material.dart';

import '../models/work_model.dart';

class WorkProvider extends ChangeNotifier {
  List<WorkModel> workModels = [];
  int? selectedTeethNumber;
  WorkEntities? selectedEntities;

  addToModel(WorkModel model) {
    if (!workModels.contains(model)) {
      workModels.add(model);
    }
    print(model.workEntities![0].teethNumber);
    notifyListeners();
  }

  clearModel() {
    workModels.clear();
    notifyListeners();
  }

  clearTeethNumber() {
    selectedTeethNumber = null;
    notifyListeners();
  }

  selectTeethNumber(int teethNumber, WorkEntities entities) {
    selectedTeethNumber = teethNumber;
    selectedEntities = entities;
    notifyListeners();
  }

  selectedWorkModelMetalUpdate(
      {bool? isMetal, bool? isMetalAbove, bool? isMetalProva}
      // bool? isBridge,
      // bool? isEMax,
      // bool? isTemp,
      // bool? isNigthPlaque,
      // bool? isHard,
      // bool? isProtez,
      // int? slideAmount,
      // int? kronAmount,
      // bool? isRepair,
      // bool? isSetBottom,
      // bool? isCageBottom,
      // String? doldarBar,
      // String? doldarFoot
      ) {
    // workModels
    //     .where((element) => element.workEntities!
    //         .any((val) => val.teethNumber == selectedTeethNumber))
    //     .first
    //     .workEntities!
    //     .first
    //     .isMetal = isMetal;
    // workModels
    //     .where((element) => element.workEntities!
    //         .any((val) => val.teethNumber == selectedTeethNumber))
    //     .first
    //     .workEntities!
    //     .first
    //     .isMetalProva = isMetalProva;
    // workModels
    //     .where((element) => element.workEntities!
    //         .any((val) => val.teethNumber == selectedTeethNumber))
    //     .first
    //     .workEntities!
    //     .first
    //     .isMetalAbove = isMetalAbove;
    selectedEntities!.isMetal = isMetal;
    selectedEntities!.isMetalProva = isMetalProva;
    selectedEntities!.isMetalAbove = isMetalAbove;
    notifyListeners();
  }

  selectedWorkModelZirkonUpdate(
  {bool? isZirkon, bool? isZirkonAbove, bool? isZirkonProva}) {
    selectedEntities!.isZirkon = isZirkon;
    selectedEntities!.isZirkonProva = isZirkonProva;
    selectedEntities!.isZirkonAbove = isZirkonAbove;
    notifyListeners();
  }

  selectedWorkModelBridgeUpdate({bool? isBridge}) {
    selectedEntities!.isBridge = isBridge;
    notifyListeners();
  }

  selectedWorkModelEmaxUpdate({bool? isEmax}) {
    selectedEntities!.isEMax = isEmax;
    notifyListeners();
  }

  selectedWorkModelTempUpdate({bool? isTemp}) {
    selectedEntities!.isTemp = isTemp;
    notifyListeners();
  }

  selectedWorkModelNightPlaqueUpdate({bool? isNightPlaque}) {
    selectedEntities!.isNigthPlaque = isNightPlaque;
    notifyListeners();
  }

  selectedWorkModelProtezUpdate(
      {bool? isProtez,
      int? slideAmount,
      int? kronAmount,
      bool? isRepair,
      bool? isSetBottom,
      bool? isCageBottom,
      String? doldarBar,
      String? doldarFoot}) {
    selectedEntities!.isProtez = isProtez;
    selectedEntities!.slideAmount = slideAmount;
    selectedEntities!.kronAmount = kronAmount;
    selectedEntities!.isRepair = isRepair;
    selectedEntities!.isSetBottom = isSetBottom;
    selectedEntities!.isCageBottom = isCageBottom;
    selectedEntities!.doldarFoot = doldarFoot;
    selectedEntities!.doldarBar = doldarBar;
    notifyListeners();
  }
}
