import 'package:mobx/mobx.dart';

part 'get_student_controller.g.dart';

class GetStudentController = GetStudentControllerBase with _$GetStudentController;

abstract class GetStudentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void getStudents(int id) {}
}
