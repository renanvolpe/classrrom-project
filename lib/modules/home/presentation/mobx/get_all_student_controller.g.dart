// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAllStudentsController on GetAllStudentsControllerBase, Store {
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

  late final _$getStudentAsyncAction =
      AsyncAction('GetAllStudentsControllerBase.getStudent', context: context);

  @override
  Future<dynamic> getStudent() {
    return _$getStudentAsyncAction.run(() => super.getStudent());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage}
    ''';
  }
}
