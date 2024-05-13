import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokey_box/models/exercise_model.dart';
import 'package:mokey_box/shared/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditExerciseController extends GetxController{
  TextEditingController exerciseEditingController = TextEditingController();
  var exerciseList = <ExerciseModel>[].obs;
  var finalExerciseList = <ExerciseModel>[].obs;
  var text = "Exercise".obs;
  var filteredText = [].obs;
  var selectedFilteredText = [].obs;
  var equipments = [].obs;
  var selectedEquipments = [].obs;
  var prefs = Get.find<SharedPreferences>();
  var exrList = [].obs;
  var index = 0.obs;
  var key = "".obs;


  @override
  onInit()async{
    await loadData();
    super.onInit();
  }

  Future<String> loadData() async {
    var arguments = Get.arguments();
   var data =  arguments['data'];


    exerciseList.value = data.map((e) => ExerciseModel.fromJson(e)).toList();
    finalExerciseList.value =
        data.map((e) => ExerciseModel.fromJson(e)).toList();



    // catalogdata = json.decode(data);

    return "success";
  }

  storeInLocal()async {
    List<ExerciseModel> selectedData =
    finalExerciseList.where((p0) => p0.selected!.value).toList();
    exrList[index.value] = {"title":key ,'data':finalExerciseList.value};
    var finalData = [];
    for (int i = 0; i < selectedData.length; i++) {
      finalData.add(selectedData[i].toJson());
    }
    //exrList.value.add({"title":key,"data":finalData}.obs);
    prefs.setString(StorageConstants.storedData, jsonEncode(exrList.value));
    Get.back();

    await loadData();
  }
}