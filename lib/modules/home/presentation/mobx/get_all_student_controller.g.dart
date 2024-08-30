// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAllStudentsController on GetAllStudentsControllerBase, Store {
  late final _$userListFutureAtom = Atom(
      name: 'GetAllStudentsControllerBase.userListFuture', context: context);

  @override
  ObservableFuture<List<StudentEntity>>? get userListFuture {
    _$userListFutureAtom.reportRead();
    return super.userListFuture;
  }

  @override
  set userListFuture(ObservableFuture<List<StudentEntity>>? value) {
    _$userListFutureAtom.reportWrite(value, super.userListFuture, () {
      super.userListFuture = value;
    });
  }

  late final _$getStudentAsyncAction =
      AsyncAction('GetAllStudentsControllerBase.getStudent', context: context);

  @override
  Future<List<StudentEntity>> getStudent() {
    return _$getStudentAsyncAction.run(() => super.getStudent());
  }

  late final _$GetAllStudentsControllerBaseActionController =
      ActionController(name: 'GetAllStudentsControllerBase', context: context);

  @override
  Future<dynamic> fetchUsers(int id) {
    final _$actionInfo = _$GetAllStudentsControllerBaseActionController
        .startAction(name: 'GetAllStudentsControllerBase.fetchUsers');
    try {
      return super.fetchUsers(id);
    } finally {
      _$GetAllStudentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userListFuture: ${userListFuture}
    ''';
  }
}
