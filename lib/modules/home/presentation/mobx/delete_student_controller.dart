

import 'package:mobx/mobx.dart';
part 'delete_student_controller.g.dart';

class DeleteStudentController = DeleteStudentControllerBase with _$DeleteStudentController;

abstract class DeleteStudentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void deleteStudent(int id) {}
}
