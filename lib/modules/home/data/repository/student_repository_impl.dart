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
  Future<Either<Failure, String>> addStudent(String name) async {
    try {
      var response = await _studentLocalDataSource.addStudent();

      return Right(response as String);
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteStudent() async {
    var response = await _studentLocalDataSource.deleteStudent();
    return Right(response as String);
  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getAllStudents() async {

    try {
      var response = await _studentLocalDataSource.getAllStudents();
      return response.fold((failure) => const Left(ServerFailure()), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> getStudent() async {
    var response = await _studentLocalDataSource.getStudent();
    return Right(response as StudentEntity);
  }
}
