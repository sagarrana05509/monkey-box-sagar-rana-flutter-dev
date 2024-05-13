import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokey_box/screens/edit_exercise/edit_exercise_controller.dart';
import 'package:mokey_box/screens/exercise_list_screen/widgets/exercise_list_widgets.dart';
import 'package:mokey_box/utils/math_utils.dart';
import 'package:mokey_box/widgets/input_field.dart';

class EditExerciseView extends GetView<EditExerciseController> {
  const EditExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputTextField(controller:controller.exerciseEditingController ),
            SizedBox(height: getSize(20),),
            Obx(() => Expanded(
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
            )),
            SizedBox(height: getSize(20),),
            Container(
              height: getSize(50),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            SizedBox(height: getSize(20),),
          ],
        ),
      ),
    );
  }
}
