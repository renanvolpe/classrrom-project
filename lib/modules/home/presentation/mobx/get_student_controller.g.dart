// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetStudentController on GetStudentControllerBase, Store {
  late final _$valueAtom =
      Atom(name: 'GetStudentControllerBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$GetStudentControllerBaseActionController =
      ActionController(name: 'GetStudentControllerBase', context: context);

  @override
  void getStudents(int id) {
    final _$actionInfo = _$GetStudentControllerBaseActionController.startAction(
        name: 'GetStudentControllerBase.getStudents');
    try {
      return super.getStudents(id);
    } finally {
      _$GetStudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
