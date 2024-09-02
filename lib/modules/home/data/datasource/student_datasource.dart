import 'package:classroom_project/database/classrom_fields.dart';
import 'package:classroom_project/database/classroom_tables.dart';
import 'package:classroom_project/modules/home/data/datasource/abstract_student_datasource.dart';
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/shared/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class StudentLocalDataSource implements IStudentLocalDataSource {
  final Database _database;

  StudentLocalDataSource(this._database);

  @override
  Future<Either<Failure, int>> addStudent(String studentName) async {
    var json = {ClassromFields.name: studentName};
    try {
      final id = await _database.insert(ClassroomTables.student, json);
      return Right(id);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteStudent(int id) async {
    try {
      final newId = await _database.delete(
        ClassroomTables.student,
        where: '$id = ?',
        whereArgs: [id],
      );
      return Right(newId);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getAllStudents() async {
    try {
      final result = await _database.query(ClassroomTables.student);
      List<StudentEntity> listStudents = result.map((json) => _toStudentEntity(json)).toList();
      return Right(listStudents);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> getStudent(int id) async {
    try {
      List<Map<String, Object?>> maps = await _database.query(
        ClassroomTables.student,
        where: '${ClassromFields.id} = ?',
        whereArgs: [id],
      );

      return Right(_toStudentEntity(maps.first));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}

StudentEntity _toStudentEntity(Map<String, Object?> json) {
  return StudentEntity(id: json["code"] as int, name: json["nome"] as String);
}
