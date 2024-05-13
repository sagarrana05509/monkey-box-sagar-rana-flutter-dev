import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mokey_box/models/exercise_model.dart';
import 'package:mokey_box/shared/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseListController extends GetxController {
  TextEditingController exerciseEditingController = TextEditingController();
  TextEditingController searchEditingController = TextEditingController();
  var exerciseList = <ExerciseModel>[].obs;
  var finalExerciseList = <ExerciseModel>[].obs;
  var text = "Exercise".obs;
  var filteredText = [].obs;
  var selectedFilteredText = [].obs;
  var equipments = [].obs;
  var selectedEquipments = [].obs;
  var prefs = Get.find<SharedPreferences>();
  var exrList = [].obs;

  @override
  onInit() async {
    await loadData();
    super.onInit();
  }

  Future<String> loadData() async {
    var data = await rootBundle.loadString("assets/files/exercise.json");
    var list = json.decode(data)['entity']['data'] as List;
    exerciseList.value = list.map((e) => ExerciseModel.fromJson(e)).toList();
    finalExerciseList.value =
        list.map((e) => ExerciseModel.fromJson(e)).toList();
    for (int i = 0; i < finalExerciseList.length; i++) {
      if (finalExerciseList[i].equipments!.isNotEmpty) {
        finalExerciseList[i].equipments!.forEach((element) {
          equipments.value.add(element.name);
        });
      }
      if (finalExerciseList[i].mainMuscles!.isNotEmpty) {
        finalExerciseList[i].mainMuscles!.forEach((element) {
          filteredText.value.add(element.name);
        });
      }
      if (finalExerciseList[i].secondaryMuscles!.isNotEmpty) {
        finalExerciseList[i].secondaryMuscles!.forEach((element) {
          filteredText.value.add(element.name);
        });
      }
      if (finalExerciseList[i].categories!.isNotEmpty) {
        finalExerciseList[i].categories!.forEach((element) {
          filteredText.value.add(element.name);
        });
      }
      print(filteredText);
      print(equipments);
      filteredText.value = filteredText.value.toSet().toList();
      equipments.value = equipments.value.toSet().toList();
    }
    var result = prefs.getString(StorageConstants.storedData);
    if(result !=null){
      var res = jsonDecode(result);

      exrList.value = res;
      print(exerciseList.value);
    }


    // catalogdata = json.decode(data);

    return "success";
  }

  filteredData() {
    if (selectedFilteredText.isNotEmpty) {
      finalExerciseList.value = [];
    }
    for (int j = 0; j < selectedFilteredText.length; j++) {
      for (int i = 0; i < exerciseList.length; i++) {
        int count = 0;
        for (int k = 0; k < exerciseList[i].mainMuscles!.length; k++) {
          if (exerciseList[i]
              .mainMuscles![k]
              .name!
              .contains(selectedFilteredText[j])) {
            finalExerciseList.add(exerciseList[i]);
            count = 1;
            continue;
          }
        }
        for (int k = 0; k < exerciseList[i].secondaryMuscles!.length; k++) {
          if (exerciseList[i]
              .secondaryMuscles![k]
              .name!
              .contains(selectedFilteredText[j])) {
            finalExerciseList.add(exerciseList[i]);

            count = 1;
            continue;
          }
        }
        for (int k = 0; k < exerciseList[i].categories!.length; k++) {
          if (exerciseList[i]
              .categories![k]
              .name!
              .contains(selectedFilteredText[j])) {
            finalExerciseList.add(exerciseList[i]);
            count = 1;
            continue;
          }
        }
        if (count == 1) {
          continue;
        }
      }
    }
    Get.back();
  }

  equipmentData() {
    if (selectedEquipments.isNotEmpty) {
      finalExerciseList.value = [];
    }
    for (int j = 0; j < selectedEquipments.length; j++) {
      for (int i = 0; i < exerciseList.length; i++) {
        int count = 0;
        for (int k = 0; k < exerciseList[i].equipments!.length; k++) {
          if (exerciseList[i]
              .equipments![k]
              .name!
              .contains(selectedEquipments[j])) {
            finalExerciseList.add(exerciseList[i]);
            count = 1;
            continue;
          }
        }
        if (count == 1) {
          continue;
        }
      }
    }
    Get.back();
  }

  storeInLocal()async {
    List<ExerciseModel> selectedData =
        finalExerciseList.where((p0) => p0.selected!.value).toList();
    var finalData = [];
    for (int i = 0; i < selectedData.length; i++) {
      finalData.add(selectedData[i].toJson());
    }
    var map = {
      "title": exerciseEditingController.text,
      "data": finalData
    };


    exrList.value.add({"title":exerciseEditingController.text,"data":finalData}.obs);
    prefs.setString(StorageConstants.storedData, jsonEncode(exrList.value));
    Get.back();
    exerciseEditingController.clear();
    finalExerciseList.value = exerciseList.value;
    selectedFilteredText.value = [];
    selectedEquipments.value = [];
    exrList.refresh();
    await loadData();
  }
}
