import 'package:classroom_project/shared/state_mixin.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/student_usecase.dart';

part 'edit_student_controller.g.dart';

class EditStudentController = EditStudentControllerBase with _$EditStudentController;

abstract class EditStudentControllerBase with Store implements IApiCall {
  final EditStudentUsecase _usecase;

  EditStudentControllerBase(this._usecase);

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

  @action
  Future getStudents(int id) async {
    setState(AppState.inProgress);
    await Future.delayed(const Duration(seconds: 2));
    var response = await _usecase.call(id);
     response.fold((failure) {
      setState(AppState.failure);
      errorMessage = failure.message;
    }, (success) {
      setState(AppState.success);
      student = success;
    });
  }
}
