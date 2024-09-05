// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:mobx/mobx.dart';

part 'student_controller.g.dart';

class StudentController = StudentControllerBase with _$StudentController;

abstract class StudentControllerBase with Store {
  
  @observable
  ObservableList<StudentEntity> listStudent = ObservableList<StudentEntity>();

  @observable
  StudentEntity? studentSelected;

  @action
  Future getStudents(int id) async => listStudent.firstWhere((e) => e.id == id);

  @action
  void addStudent(StudentEntity student) {
    listStudent.addAll([student]);
  }

  @action
  void getAllStudents(List<StudentEntity>? list) {
    if (list != null) {
      listStudent.clear();
      listStudent.addAll(list);
    }
  }

  @action
  Future deleteStudent(int id) async => listStudent.removeWhere((element) => element.id == id);
  @action
  editStudent(StudentEntity student) {
    for (var e in listStudent) {
      if (e.id == student.id) {
        e = student;
        break;
      }
    }
  }
}
