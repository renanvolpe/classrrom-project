// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:mobx/mobx.dart';

part '../student_controller.g.dart';

class StudentController = StudentControllerBase with _$StudentController;

abstract class StudentControllerBase with Store {
  ObservableList<StudentEntity> listStudent = ObservableList<StudentEntity>().asObservable();

  @observable
  StudentEntity? studentSelected;

  @action
  void getStudents(int id) => listStudent.firstWhere((e) => e.id == id);

  @action
  void addStudent(StudentEntity student, [int? index]) {
    listStudent.insert(index ?? listStudent.length, student);
  }

  @action
  void getAllStudents(List<StudentEntity>? list) {
    if (list != null) {
      listStudent.clear();
      listStudent.addAll(list);
    }
  }

  @action
  void deleteStudent(int id) => listStudent.removeWhere((element) => element.id == id);

  @action
  void editStudent(StudentEntity student) {
    int index = listStudent.indexWhere((e) => e.id == student.id);
    deleteStudent(student.id);
    addStudent(student, index);
  }
}
