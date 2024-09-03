// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAllStudentsController on GetAllStudentsControllerBase, Store {
  Computed<AppState>? _$stateComputed;

  @override
  AppState get state =>
      (_$stateComputed ??= Computed<AppState>(() => super.state,
              name: 'GetAllStudentsControllerBase.state'))
          .value;

  late final _$userListFutureAtom = Atom(
      name: 'GetAllStudentsControllerBase.userListFuture', context: context);

  @override
  ObservableList<StudentEntity> get userListFuture {
    _$userListFutureAtom.reportRead();
    return super.userListFuture;
  }

  @override
  set userListFuture(ObservableList<StudentEntity> value) {
    _$userListFutureAtom.reportWrite(value, super.userListFuture, () {
      super.userListFuture = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'GetAllStudentsControllerBase.status', context: context);

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
      Atom(name: 'GetAllStudentsControllerBase.errorMessage', context: context);

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

  late final _$getAllStudentsAsyncAction = AsyncAction(
      'GetAllStudentsControllerBase.getAllStudents',
      context: context);

  @override
  Future<dynamic> getAllStudents() {
    return _$getAllStudentsAsyncAction.run(() => super.getAllStudents());
  }

  late final _$GetAllStudentsControllerBaseActionController =
      ActionController(name: 'GetAllStudentsControllerBase', context: context);

  @override
  void setState(AppState newStatus) {
    final _$actionInfo = _$GetAllStudentsControllerBaseActionController
        .startAction(name: 'GetAllStudentsControllerBase.setState');
    try {
      return super.setState(newStatus);
    } finally {
      _$GetAllStudentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userListFuture: ${userListFuture},
status: ${status},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
