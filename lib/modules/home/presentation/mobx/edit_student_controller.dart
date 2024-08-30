

import 'package:mobx/mobx.dart';

part 'edit_student_controller.g.dart';

class EditStudentController = EditStudentControllerBase with _$EditStudentController;

abstract class EditStudentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void editStudent(String name) {}
}
