import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:dartz/dartz.dart';

abstract class IStudentRepository {
  //crud student
 Future<Either<String, List<StudentEntity>>> getAllStudents();
  Future<Either<String,StudentEntity>> getStudent();
  Future<Either<String, String>> addStudent();
  Future<Either<String, String>> deleteStudent();
  

}
