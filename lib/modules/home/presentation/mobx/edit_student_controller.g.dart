// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student/edit_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditStudentController on EditStudentControllerBase, Store {
  Computed<AppState>? _$stateComputed;

  @override
  AppState get state =>
      (_$stateComputed ??= Computed<AppState>(() => super.state,
              name: 'EditStudentControllerBase.state'))
          .value;

  late final _$statusAtom =
      Atom(name: 'EditStudentControllerBase.status', context: context);

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
      Atom(name: 'EditStudentControllerBase.errorMessage', context: context);

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
      Atom(name: 'EditStudentControllerBase.student', context: context);

  @override
  String? get student {
    _$studentAtom.reportRead();
    return super.student;
  }

  @override
  set student(String? value) {
    _$studentAtom.reportWrite(value, super.student, () {
      super.student = value;
    });
  }

  late final _$editStudentsAsyncAction =
      AsyncAction('EditStudentControllerBase.editStudents', context: context);

  @override
  Future<dynamic> editStudents(StudentEntity newStudent) {
    return _$editStudentsAsyncAction.run(() => super.editStudents(newStudent));
  }

  late final _$EditStudentControllerBaseActionController =
      ActionController(name: 'EditStudentControllerBase', context: context);

  @override
  void setState(AppState newStatus) {
    final _$actionInfo = _$EditStudentControllerBaseActionController
        .startAction(name: 'EditStudentControllerBase.setState');
    try {
      return super.setState(newStatus);
    } finally {
      _$EditStudentControllerBaseActionController.endAction(_$actionInfo);
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
