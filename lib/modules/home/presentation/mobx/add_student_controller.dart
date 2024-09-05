import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/shared/state_mixin.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/student_usecase.dart';

part 'add_student_controller.g.dart';

class AddStudentController = AddStudentControllerBase with _$AddStudentController;

abstract class AddStudentControllerBase with Store implements IApiCall {
  final AddStudentUsecase _usecase;

  AddStudentControllerBase(this._usecase);

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
  int id = 0;

  @action
  Future addStudent(String name) async {
    setState(AppState.inProgress);

    await Future.delayed(const Duration(seconds: 2));

    var response = await _usecase.call(name);

    return response.fold((failure) {
      setState(AppState.failure);
      errorMessage = failure.message;
    }, (success) {
      setState(AppState.success);
      id = success;
      return StudentEntity(id: id, name: name);
    });
  }
}
