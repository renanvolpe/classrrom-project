import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/modules/home/domain/usecase/student_usecase.dart';
import 'package:classroom_project/modules/shared/state_mixin.dart';
import 'package:mobx/mobx.dart';

part 'get_all_student_controller.g.dart';

class GetAllStudentsController = GetAllStudentsControllerBase with _$GetAllStudentsController;

abstract class GetAllStudentsControllerBase with Store implements IApiCall {
  final GetAllStudentsUsecase _usecase;

  GetAllStudentsControllerBase(this._usecase);

  @override
  @observable
  AppState status = AppState.initial;

  @override
  @computed
  AppState get state => status;

  @override
  @observable
  String? errorMessage;

  @override
  @action
  void setState(AppState newStatus) {
    status = newStatus;
  }

  @observable
  ObservableList<StudentEntity> userListFuture = ObservableList<StudentEntity>();

  @action
  Future<List<StudentEntity>?> getAllStudents() async {
    setState(AppState.inProgress);

    await Future.delayed(const Duration(seconds: 2));
    //get data here
    try {
      var response = await _usecase.call(Object());
      return response.fold((failure) {
        setState(AppState.failure);
        errorMessage = failure.message;
        return null;
      }, (success) {
        setState(AppState.success);
        userListFuture.clear();
        userListFuture.addAll(success);
        return userListFuture;
      });
    } catch (e) {
      setState(AppState.failure);
      errorMessage = e.toString();
    }
    return null;
  }
}
