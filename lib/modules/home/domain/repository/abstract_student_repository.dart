import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/shared/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IStudentRepository {
  //crud student
  Future<Either<Failure, List<StudentEntity>?>> getAllStudents();
  Future<Either<Failure, StudentEntity>> getStudent(int id);
  Future<Either<Failure, int?>> addStudent(String name);
  Future<Either<Failure, int?>> deleteStudent(int id);
  Future<Either<Failure, int?>> editStudent(StudentEntity student);
}
