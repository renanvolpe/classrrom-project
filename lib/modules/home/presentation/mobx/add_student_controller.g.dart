// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddStudentController on AddStudentControllerBase, Store {
  Computed<AppState>? _$stateComputed;

  @override
  AppState get state =>
      (_$stateComputed ??= Computed<AppState>(() => super.state,
              name: 'AddStudentControllerBase.state'))
          .value;

  late final _$statusAtom =
      Atom(name: 'AddStudentControllerBase.status', context: context);

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
      Atom(name: 'AddStudentControllerBase.errorMessage', context: context);

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

  late final _$idAtom =
      Atom(name: 'AddStudentControllerBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$addStudentAsyncAction =
      AsyncAction('AddStudentControllerBase.addStudent', context: context);

  @override
  Future<dynamic> addStudent(String name) {
    return _$addStudentAsyncAction.run(() => super.addStudent(name));
  }

  late final _$AddStudentControllerBaseActionController =
      ActionController(name: 'AddStudentControllerBase', context: context);

  @override
  void setState(AppState newStatus) {
    final _$actionInfo = _$AddStudentControllerBaseActionController.startAction(
        name: 'AddStudentControllerBase.setState');
    try {
      return super.setState(newStatus);
    } finally {
      _$AddStudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
errorMessage: ${errorMessage},
id: ${id},
state: ${state}
    ''';
  }
}
