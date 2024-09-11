// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student/delete_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeleteStudentController on DeleteStudentControllerBase, Store {
  Computed<AppState>? _$stateComputed;

  @override
  AppState get state =>
      (_$stateComputed ??= Computed<AppState>(() => super.state,
              name: 'DeleteStudentControllerBase.state'))
          .value;

  late final _$statusAtom =
      Atom(name: 'DeleteStudentControllerBase.status', context: context);

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
      Atom(name: 'DeleteStudentControllerBase.errorMessage', context: context);

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
      Atom(name: 'DeleteStudentControllerBase.student', context: context);

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

  late final _$idDeletingAtom =
      Atom(name: 'DeleteStudentControllerBase.idDeleting', context: context);

  @override
  int get idDeleting {
    _$idDeletingAtom.reportRead();
    return super.idDeleting;
  }

  @override
  set idDeleting(int value) {
    _$idDeletingAtom.reportWrite(value, super.idDeleting, () {
      super.idDeleting = value;
    });
  }

  late final _$deleteStudentAsyncAction = AsyncAction(
      'DeleteStudentControllerBase.deleteStudent',
      context: context);

  @override
  Future<dynamic> deleteStudent(int id) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(id));
  }

  late final _$DeleteStudentControllerBaseActionController =
      ActionController(name: 'DeleteStudentControllerBase', context: context);

  @override
  void setState(AppState newStatus) {
    final _$actionInfo = _$DeleteStudentControllerBaseActionController
        .startAction(name: 'DeleteStudentControllerBase.setState');
    try {
      return super.setState(newStatus);
    } finally {
      _$DeleteStudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
errorMessage: ${errorMessage},
student: ${student},
idDeleting: ${idDeleting},
state: ${state}
    ''';
  }
}
