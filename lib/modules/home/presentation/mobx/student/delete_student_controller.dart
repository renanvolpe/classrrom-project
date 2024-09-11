import 'package:classroom_project/modules/home/domain/usecase/student_usecase.dart';
import 'package:classroom_project/modules/shared/state_mixin.dart';
import 'package:mobx/mobx.dart';

part '../delete_student_controller.g.dart';

class DeleteStudentController = DeleteStudentControllerBase with _$DeleteStudentController;

abstract class DeleteStudentControllerBase with Store implements IApiCall {
  final DeleteStudentUsecase _usecase;

  DeleteStudentControllerBase(this._usecase);

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
  String? student;

  @observable
  int idDeleting = 0;

  @action
  Future deleteStudent(int id) async {
    idDeleting = id;
    setState(AppState.inProgress);
    await Future.delayed(const Duration(seconds: 2));
    var response = await _usecase.call(id);
    return response.fold((failure) {
      setState(AppState.failure);
      errorMessage = failure.message;
    }, (success) {
      setState(AppState.success);
      student = success;
    });
  }
}
