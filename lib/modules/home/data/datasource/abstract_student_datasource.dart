import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:dartz/dartz.dart';

abstract class IStudentLocalDataSource {
  Future<Either<String, List<StudentEntity>>> getAllStudents();
  Future<Either<String, StudentEntity>> getStudent();
  Future<Either<String, String>> addStudent();
  Future<Either<String, String>> deleteStudent();
}
