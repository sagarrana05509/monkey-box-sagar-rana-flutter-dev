import 'package:get/get.dart';
import 'package:mokey_box/screens/exercise_list_screen/exercise_list_controller.dart';

class ExerciseListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExerciseListController>(() => ExerciseListController());
  }
}