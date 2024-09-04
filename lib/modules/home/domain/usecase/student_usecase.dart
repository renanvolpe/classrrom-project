import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/shared/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/abstract_usecase.dart';
import '../repository/abstract_student_repository.dart';

class GetStudentUsecase implements IUseCase {
  GetStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  @override
  Future<Either<Failure, StudentEntity>> call(params) async {
    try {
      var response = await _repository.getStudent(params);
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
      return response.fold((failure) {
        throw (failure);
      }, (success) {
        if (success == null || success.isEmpty) {
          throw const UnexpectedFailure("There is no students yet");
        }
        return Right(success);
      });
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } on UnexpectedFailure catch (e) {
      return Left(UnexpectedFailure(e.message));
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
      var response = await _repository.deleteStudent(params);
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
  Future<Either<Failure, int>> call(params) async {
    try {
      var response = await _repository.addStudent(params);
      return response.fold((failure) {
        throw (failure);
      }, (success) {
        return Right(success!);
      });
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } on UnexpectedFailure catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }
}

class EditStudentUsecase implements IUseCase {
  EditStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  @override
  Future<Either<Failure, String>> call(params) async {
    try {
      var response = await _repository.editStudent(params);
      return response.fold((failure) {
        throw (failure);
      }, (success) {
        if (success == null) {
          throw const UnexpectedFailure("The error was not expected");
        }
        return Right("Success to update Student id: $id");
      });
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } on UnexpectedFailure catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }
}
