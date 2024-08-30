import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/shared/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/abstract_use_case.dart';
import '../repository/abstract_student_repository.dart';

class GetStudentUsecase implements IUseCase {
  GetStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  @override
  Future<Either<Failure, StudentEntity>> call(params) async {
    try {
      var response = await _repository.getStudent();
      return Right(response as StudentEntity);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}

class GetAllStudentsUsecase implements IUseCase {
  GetAllStudentsUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  @override
  Future<Either<Failure, List<StudentEntity>>> call(params) async {
    try {
      var response = await _repository.getAllStudents();
      return Right(response as List<StudentEntity>);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}

class DeleteStudentUsecase implements IUseCase {
  DeleteStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  @override
  Future<Either<Failure, String>> call(params) async {
    try {
      var response = await _repository.deleteStudent();
      return Right(response as String);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}

class AddStudentUsecase implements IUseCase {
  AddStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  @override
  Future<Either<Failure, String>> call(params) async {
    try {
      var response = await _repository.addStudent(params);
      return Right(response as String);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
