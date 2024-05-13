import 'package:get/get.dart';
import 'package:mokey_box/screens/edit_exercise/edit_exercise_controller.dart';

class EditExerciseBindings extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => EditExerciseController());
  }

}