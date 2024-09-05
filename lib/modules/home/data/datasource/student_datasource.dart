import 'package:classroom_project/database/classrom_fields.dart';
import 'package:classroom_project/database/classroom_tables.dart';
import 'package:classroom_project/database/sqlite_config.dart';
import 'package:classroom_project/modules/home/data/datasource/abstract_student_datasource.dart';
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/shared/failure.dart';
import 'package:dartz/dartz.dart';

class StudentLocalDataSource implements IStudentLocalDataSource {
  final SqliteConfig _sqliteConfig;

  StudentLocalDataSource(this._sqliteConfig);

  @override
  Future<Either<Failure, int>> addStudent(String studentName) async {
    var json = {ClassromFields.name: studentName};
    try {
      final id = await _sqliteConfig.database.insert(ClassroomTables.student, json);
      return Right(id);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteStudent(int id) async {
    try {
      final newId = await _sqliteConfig.database.delete(
        ClassroomTables.student,
        where: '${ClassromFields.id} = ?',
        whereArgs: [id],
      );
      return Right(newId);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<StudentEntity>?>> getAllStudents() async {
    try {
      final result = await _sqliteConfig.database.query(ClassroomTables.student);
      List<StudentEntity>? listStudents = result.map((json) => _toStudentEntity(json)).toList();
      return Right(listStudents);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> getStudent(int id) async {
    try {
      List<Map<String, Object?>> maps = await _sqliteConfig.database.query(
        ClassroomTables.student,
        where: '${ClassromFields.id} = ?',
        whereArgs: [id],
      );

      return Right(_toStudentEntity(maps.first));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> editStudent(StudentEntity student) async {
    try {
      var mapTpUpdate = {ClassromFields.name: student.name};
      var maps = await _sqliteConfig.database.update(
        ClassroomTables.student,
        mapTpUpdate,
        where: '${ClassromFields.id} = ?',
        whereArgs: [student.id],
      );

      return Right(maps);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}

StudentEntity _toStudentEntity(Map<String, Object?> json) {
  return StudentEntity(id: json["code"] as int, name: json["nome"] as String);
}
