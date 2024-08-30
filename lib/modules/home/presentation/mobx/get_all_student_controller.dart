import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/shared/state_mixin.dart';
import 'package:mobx/mobx.dart';

part 'get_all_student_controller.g.dart';

class GetAllStudentsController = GetAllStudentsControllerBase with _$GetAllStudentsController;


abstract class GetAllStudentsControllerBase with Store, StateMixin<GetAllStudentsControllerBase> {

  @observable
  ObservableFuture<List<StudentEntity>>? userListFuture;

  @action
  void getStudent(int id) {
    //pressed button
    setState(AppState.inProgress);
    //get data gere
    //success
    setState(AppState.success);
    //failure
     setState(AppState.failure);

    
  }
  
}


