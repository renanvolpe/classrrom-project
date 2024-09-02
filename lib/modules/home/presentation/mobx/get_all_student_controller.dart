import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/modules/home/domain/usecase/student_usecase.dart';
import 'package:classroom_project/shared/state_mixin.dart';
import 'package:mobx/mobx.dart';

part 'get_all_student_controller.g.dart';

class GetAllStudentsController = GetAllStudentsControllerBase with _$GetAllStudentsController;

abstract class GetAllStudentsControllerBase with Store, StateMixin<GetAllStudentsControllerBase> {
  final GetAllStudentsUsecase _usecase;

  GetAllStudentsControllerBase(this._usecase);

  @observable
  String? errorMessage;

  ObservableList<StudentEntity>? userListFuture;


  @action
  Future getStudent() async {
    //pressed button
    setState(AppState.inProgress);
    //get data gere
    var response = await _usecase.call(Object());

    return response.fold((failure) {
      //failure
      setState(AppState.failure);
      errorMessage = failure.message;
    }, (success) {
      //success
      setState(AppState.success);

      userListFuture!.addAll(success);
    });
  }
}
