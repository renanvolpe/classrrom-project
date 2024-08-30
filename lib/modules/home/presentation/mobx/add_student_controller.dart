

import 'package:mobx/mobx.dart';


part 'add_student_controller.g.dart';

class AddStudentController = AddStudentControllerBase with _$AddStudentController;

abstract class AddStudentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void addStudent(String name) {}
}
