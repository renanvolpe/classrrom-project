import 'package:classroom_project/modules/home/data/datasource/abstract_student_datasource.dart';
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/modules/home/domain/repository/abstract_student_repository.dart';
import 'package:dartz/dartz.dart';

class StudentRepositoryImpl  implements IStudentRepository{
  // final IStudentRemoteDataSource studentRemoteDataSource;

  final IStudentLocalDataSource _studentLocalDataSource;
  StudentRepositoryImpl({
    required IStudentLocalDataSource datasource,
  }) : _studentLocalDataSource = datasource;

  @override
  Future<Either<String, String>> addStudent() async{
    var response = await _studentLocalDataSource.addStudent();

    return response;
  }

  @override
  Future<Either<String, String>> deleteStudent() async{
     var response = await _studentLocalDataSource.deleteStudent();
     return response;
  }

  @override
  Future<Either<String, List<StudentEntity>>> getAllStudents() async{
    var response = await _studentLocalDataSource.getAllStudents();
    return response;
    
  }

  @override
  Future<Either<String, StudentEntity>> getStudent() async{
    var response = await _studentLocalDataSource.getStudent();
    return response;


  }
}