import 'package:get/get.dart';
import 'package:mokey_box/screens/edit_exercise/edit_exercise_bindings.dart';
import 'package:mokey_box/screens/edit_exercise/edit_exercise_view.dart';
import 'package:mokey_box/screens/exercise_list_screen/exercise_list_bindings.dart';
import 'package:mokey_box/screens/exercise_list_screen/exercise_list_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.EXERCISE_LIST,
        page: () => const ExerciseListView(),
        binding: ExerciseListBindings()),
    GetPage(
        name: Routes.EDIT_EXERCISE,
        page: () => const EditExerciseView(),
        binding: EditExerciseBindings ()),
  ];
  static List lst = [];
}
