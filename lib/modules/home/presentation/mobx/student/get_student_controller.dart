// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/modules/home/domain/usecase/student_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/state_mixin.dart';

part '../get_student_controller.g.dart';

class GetStudentController = GetStudentControllerBase with _$GetStudentController;

abstract class GetStudentControllerBase with Store implements IApiCall {
  final GetStudentUsecase _usecase;

  GetStudentControllerBase(this._usecase);

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
  StudentEntity? student;

  @action
  Future getStudents(int id) async {
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
