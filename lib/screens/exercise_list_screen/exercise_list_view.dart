import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mokey_box/screens/exercise_list_screen/exercise_list_controller.dart';
import 'package:mokey_box/utils/math_utils.dart';
import 'package:mokey_box/widgets/base_text.dart';
import 'package:mokey_box/widgets/input_field.dart';

import 'widgets/exercise_list_widgets.dart';

class ExerciseListView extends GetView<ExerciseListController> {
  const ExerciseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Obx(() => BaseText(
              text: controller.text.value,
              fontSize: 22,
            )),
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getSize(20), horizontal: getSize(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => ListView.builder(
                  itemCount: controller.exrList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return WorkOutWidget(
                      title: controller.exrList[index] ['title'],
                      onTap: (index) {},
                      index: index,
                    );
                  })),
              SizedBox(
                height: getSize(20),
              ),
              InkWell(
                onTap: () async {
                  await displayTextInputDialog(context);
                },
                child: Container(
                  height: getSize(60),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.5)),
                  child: const Center(
                      child: BaseText(
                    text: "Add Workout plan +",
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const BaseText(text: 'Exercise title'),
          content: InputTextField(
            controller: controller.exerciseEditingController,
            hintText: "Exercise Name",
          ),
          actions: <Widget>[
            GestureDetector(
              child: const BaseText(text: 'CANCEL'),
              onTap: () {
                controller.searchEditingController.clear();
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              child: const BaseText(text: 'OK'),
              onTap: () async {
                Get.back();
                FocusManager.instance.primaryFocus!.unfocus();
                if (controller.exerciseEditingController.text.isNotEmpty) {
                  await showBottomSheet(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(20), vertical: getSize(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            controller.searchEditingController.clear();
                            Get.back();
                          },
                          child: const BaseText(text: "Cancel")),
                       InkWell(
                         onTap: ()=> controller.storeInLocal(),
                           child: const BaseText(text: "Add")),
                    ],
                  ),
                  SizedBox(
                    height: getSize(10),
                  ),
                  const BaseText(text: "Library"),
                  SizedBox(height: getSize(20),),
                  InputTextField(
                    hintText: "Search.....",
                    controller: controller.searchEditingController,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.finalExerciseList.value = [];
                        for (int i = 0;
                            i < controller.exerciseList.length;
                            i++) {
                          if (controller.exerciseList[i].name
                              .toString()
                              .trim()
                              .toLowerCase()
                              .contains(value.trim().toLowerCase())) {
                            controller.finalExerciseList
                                .add(controller.exerciseList[i]);
                          }
                        }
                      } else {
                        controller.finalExerciseList.value =
                            controller.exerciseList;
                      }
                    },
                  ),
                  SizedBox(
                    height: getSize(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          await groupBottomSheet(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(10), vertical: getSize(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 0.5,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Row(
                            children: [
                              const BaseText(text: "All Group"),
                              SizedBox(
                                width: getSize(15),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: getSize(22),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await equipmentBottomSheet(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(10), vertical: getSize(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 0.5,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Row(
                            children: [
                              const BaseText(text: "Equipments"),
                              SizedBox(
                                width: getSize(15),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: getSize(15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(20),
                  ),
                  Expanded(
                    child: Obx(() => ListView.builder(
                        itemCount: controller.finalExerciseList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: getSize(10)),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() => ExerciseListWidget(
                                title:
                                    controller.finalExerciseList[index].name!,
                                image: controller
                                        .finalExerciseList[index].angle1Image ??
                                    "",
                                selected: controller
                                    .finalExerciseList[index].selected!.value,
                                index: index,
                                onTap: (index) {
                                  print(controller.finalExerciseList[index]
                                      .selected!.value);
                                  if (controller.finalExerciseList[index]
                                      .selected!.value) {
                                    controller.finalExerciseList[index]
                                        .selected!.value = false;
                                  } else {
                                    controller.finalExerciseList[index]
                                        .selected!.value = true;
                                  }
                                  controller.exerciseList.where((p0) {
                                    if (p0.id ==
                                        controller
                                            .finalExerciseList[index].id) {
                                      p0.selected!.value = controller
                                          .finalExerciseList[index]
                                          .selected!
                                          .value;
                                    }
                                    return true;
                                  });
                                },
                              ));
                        })),
                  )
                ],
              ),
            ),
          );
        });
  }

  groupBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(20), vertical: getSize(20)),
              child: Column(
                children: [
                  const Center(child: BaseText(text: "Filter By Groups")),
                  SizedBox(
                    height: getSize(20),
                  ),
                  Expanded(
                    child: Obx(() => ListView.builder(
                        itemCount: controller.filteredText.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: getSize(10)),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() => GroupListWidget(
                                title: controller.filteredText[index],
                                //image: controller.finalExerciseList[index].angle1Image??"",
                                selected: controller.selectedFilteredText
                                    .contains(controller.filteredText[index]),
                                index: index,
                                onTap: (index) {
                                  if (controller.selectedFilteredText.contains(
                                      controller.filteredText[index])) {
                                    controller.selectedFilteredText
                                        .remove(controller.filteredText[index]);
                                  } else {
                                    controller.selectedFilteredText
                                        .add(controller.filteredText[index]);
                                  }
                                },
                              ));
                        })),
                  ),
                  SizedBox(
                    height: getSize(20),
                  ),
                  InkWell(
                    onTap: () => controller.filteredData(),
                    child: Container(
                      width: Get.width,
                      height: getSize(60),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Center(
                        child: Obx(() => BaseText(
                              text:
                                  "Filter by ${controller.selectedFilteredText.length.toString()} equipments",
                              textColor: Colors.white,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  equipmentBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(20), vertical: getSize(20)),
              child: Column(
                children: [
                  const Center(child: BaseText(text: "Filter By Equipments")),
                  SizedBox(
                    height: getSize(20),
                  ),
                  Expanded(
                    child: Obx(() => ListView.builder(
                        itemCount: controller.equipments.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: getSize(10)),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() => GroupListWidget(
                                title: controller.equipments[index],
                                //image: controller.finalExerciseList[index].angle1Image??"",
                                selected: controller.selectedEquipments
                                    .contains(controller.equipments[index]),
                                index: index,
                                onTap: (index) {
                                  if (controller.selectedEquipments
                                      .contains(controller.equipments[index])) {
                                    controller.selectedEquipments
                                        .remove(controller.equipments[index]);
                                  } else {
                                    controller.selectedEquipments
                                        .add(controller.equipments[index]);
                                  }
                                },
                              ));
                        })),
                  ),
                  SizedBox(
                    height: getSize(20),
                  ),
                  InkWell(
                    onTap: () => controller.equipmentData(),
                    child: Container(
                      width: Get.width,
                      height: getSize(60),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Obx(() => Center(
                            child: BaseText(
                              text:
                                  "Filter by ${controller.selectedEquipments.length.toString()} equipments",
                              textColor: Colors.white,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
