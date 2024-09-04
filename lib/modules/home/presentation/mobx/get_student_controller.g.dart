// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetStudentController on GetStudentControllerBase, Store {
  Computed<AppState>? _$stateComputed;

  @override
  AppState get state =>
      (_$stateComputed ??= Computed<AppState>(() => super.state,
              name: 'GetStudentControllerBase.state'))
          .value;

  late final _$statusAtom =
      Atom(name: 'GetStudentControllerBase.status', context: context);

  @override
  AppState get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppState value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'GetStudentControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$studentAtom =
      Atom(name: 'GetStudentControllerBase.student', context: context);

  @override
  StudentEntity? get student {
    _$studentAtom.reportRead();
    return super.student;
  }

  @override
  set student(StudentEntity? value) {
    _$studentAtom.reportWrite(value, super.student, () {
      super.student = value;
    });
  }

  late final _$getStudentsAsyncAction =
      AsyncAction('GetStudentControllerBase.getStudents', context: context);

  @override
  Future<dynamic> getStudents(int id) {
    return _$getStudentsAsyncAction.run(() => super.getStudents(id));
  }

  late final _$GetStudentControllerBaseActionController =
      ActionController(name: 'GetStudentControllerBase', context: context);

  @override
  void setState(AppState newStatus) {
    final _$actionInfo = _$GetStudentControllerBaseActionController.startAction(
        name: 'GetStudentControllerBase.setState');
    try {
      return super.setState(newStatus);
    } finally {
      _$GetStudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
errorMessage: ${errorMessage},
student: ${student},
state: ${state}
    ''';
  }
}
