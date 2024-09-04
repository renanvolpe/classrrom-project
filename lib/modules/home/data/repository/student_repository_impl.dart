import 'package:classroom_project/modules/home/data/datasource/abstract_student_datasource.dart';
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/modules/home/domain/repository/abstract_student_repository.dart';
import 'package:classroom_project/shared/failure.dart';
import 'package:dartz/dartz.dart';

class StudentRepositoryImpl implements IStudentRepository {
  // final IStudentRemoteDataSource studentRemoteDataSource;

  final IStudentLocalDataSource _studentLocalDataSource;
  StudentRepositoryImpl({
    required IStudentLocalDataSource datasource,
  }) : _studentLocalDataSource = datasource;

  @override
  Future<Either<Failure, int?>> addStudent(String name) async {
    try {
      var response = await _studentLocalDataSource.addStudent(name);

      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteStudent(int id) async {
    var response = await _studentLocalDataSource.deleteStudent(id);
    return Right(response as String);
  }

  @override
  Future<Either<Failure, List<StudentEntity>?>> getAllStudents() async {
    try {
      var response = await _studentLocalDataSource.getAllStudents();
      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> getStudent(int id) async {
    var response = await _studentLocalDataSource.getStudent(id);
    try {
      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, int>> editStudent(StudentEntity student)async {
     var response = await _studentLocalDataSource.editStudent(student);
    try {
      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
