import 'package:classroom_project/database/classrom_fields.dart';
import 'package:classroom_project/database/classroom_tables.dart';
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:sqflite/sqflite.dart';

class StudentCrud {
  final Database database;

  StudentCrud(this.database);

  Future<int> create(String studentName) async {
    var json = {ClassromFields.name: studentName};
    final id = await database.insert(ClassroomTables.student, json);

    return id;
  }

  Future<StudentEntity> read(int id) async {
    List<Map<String, Object?>> maps = await database.query(
      ClassroomTables.student,
      where: '${ClassromFields.id} = ?',
      whereArgs: [id],
    );
    return _toStudentEntity(maps.first);
  }

  Future<List<StudentEntity>> readAll() async {
    final result = await database.query(ClassroomTables.student);
    List<StudentEntity> listStudents = result.map((json) => _toStudentEntity(json)).toList();
    return listStudents;
  }

  Future<int> update(StudentEntity newStudent) async {
    var jsonName = {ClassromFields.name: newStudent.name};
    return database.update(
      ClassroomTables.student,
      jsonName,
      where: '${newStudent.id} = ?',
      whereArgs: [newStudent.id],
    );
  }

  Future<int> delete(int id) async {
    return await database.delete(
      ClassroomTables.student,
      where: '$id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    return await database.delete(
      ClassroomTables.student,
    );
  }

  // Future close() async {
  //   final database = await instance.database;
  //   db.close();
  // }

  StudentEntity _toStudentEntity(Map<String, Object?> json) {
    return StudentEntity(id: json["code"] as int, name: json["nome"] as String);
  }
}
