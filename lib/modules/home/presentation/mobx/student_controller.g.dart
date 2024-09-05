// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentController on StudentControllerBase, Store {
  late final _$listStudentAtom =
      Atom(name: 'StudentControllerBase.listStudent', context: context);

  @override
  ObservableList<StudentEntity> get listStudent {
    _$listStudentAtom.reportRead();
    return super.listStudent;
  }

  @override
  set listStudent(ObservableList<StudentEntity> value) {
    _$listStudentAtom.reportWrite(value, super.listStudent, () {
      super.listStudent = value;
    });
  }

  late final _$studentSelectedAtom =
      Atom(name: 'StudentControllerBase.studentSelected', context: context);

  @override
  StudentEntity? get studentSelected {
    _$studentSelectedAtom.reportRead();
    return super.studentSelected;
  }

  @override
  set studentSelected(StudentEntity? value) {
    _$studentSelectedAtom.reportWrite(value, super.studentSelected, () {
      super.studentSelected = value;
    });
  }

  late final _$getStudentsAsyncAction =
      AsyncAction('StudentControllerBase.getStudents', context: context);

  @override
  Future<dynamic> getStudents(int id) {
    return _$getStudentsAsyncAction.run(() => super.getStudents(id));
  }

  late final _$deleteStudentAsyncAction =
      AsyncAction('StudentControllerBase.deleteStudent', context: context);

  @override
  Future<dynamic> deleteStudent(int id) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(id));
  }

  late final _$StudentControllerBaseActionController =
      ActionController(name: 'StudentControllerBase', context: context);

  @override
  void addStudent(StudentEntity student) {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.addStudent');
    try {
      return super.addStudent(student);
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAllStudents(List<StudentEntity>? list) {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.getAllStudents');
    try {
      return super.getAllStudents(list);
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editStudent(StudentEntity student) {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.editStudent');
    try {
      return super.editStudent(student);
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listStudent: ${listStudent},
studentSelected: ${studentSelected}
    ''';
  }
}
