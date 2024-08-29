import 'package:classroom_project/database/sqlite_config.dart';
import 'package:classroom_project/modules/home/data/datasource/abstract_student_datasource.dart';
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:dartz/dartz.dart';

class StudentLocalDataSource implements IStudentLocalDataSource {
  final SqliteConfig sqlite;

  StudentLocalDataSource({required this.sqlite});

  @override
  Future<Either<String, String>> addStudent() {
    // TODO: implement addStudent
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> deleteStudent() {
    // TODO: implement deleteStudent
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<StudentEntity>>> getAllStudents() {
     throw UnimplementedError();
  }

  @override
  Future<Either<String, StudentEntity>> getStudent() {
    // TODO: implement getStudent
    throw UnimplementedError();
  }
}
