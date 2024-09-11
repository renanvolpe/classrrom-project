import 'package:classroom_project/modules/shared/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/abstract_usecase.dart';
import '../entity/course.dart';
import '../repository/abtract_course_repository.dart';

class GetCourseUsecase implements IUseCase {
  GetCourseUsecase({
    required ICourseRepository repository,
  }) : _repository = repository;

  final ICourseRepository _repository;

  @override
  Future<Either<Failure, CourseEntity>> call(params) async {
    try {
      var response = await _repository.getCourse(params);
      return Right(response as CourseEntity);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}

class GetAllCoursesUsecase implements IUseCase {
  GetAllCoursesUsecase({
    required ICourseRepository repository,
  }) : _repository = repository;

  final ICourseRepository _repository;

  @override
  Future<Either<Failure, List<CourseEntity>>> call(params) async {
    try {
      var response = await _repository.getAllCourses();
      return response.fold((failure) {
        throw (failure);
      }, (success) {
        if (success == null || success.isEmpty) {
          throw const UnexpectedFailure("There is no courses yet");
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

class DeleteCourseUsecase implements IUseCase {
  DeleteCourseUsecase({
    required ICourseRepository repository,
  }) : _repository = repository;

  final ICourseRepository _repository;

  @override
  Future<Either<Failure, String>> call(params) async {
    try {
      var response = await _repository.deleteCourse(params);
      return response.fold((failure) => throw failure, (success) => const Right("Succes to delete user"));
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}

class AddCourseUsecase implements IUseCase {
  AddCourseUsecase({
    required ICourseRepository repository,
  }) : _repository = repository;

  final ICourseRepository _repository;

  @override
  Future<Either<Failure, int>> call(params) async {
    try {
      var response = await _repository.addCourse(params);
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

class EditCourseUsecase implements IUseCase {
  EditCourseUsecase({
    required ICourseRepository repository,
  }) : _repository = repository;

  final ICourseRepository _repository;

  @override
  Future<Either<Failure, String>> call(params) async {
    try {
      var response = await _repository.editCourse(params);
      return response.fold((failure) {
        throw (failure);
      }, (success) {
        if (success == null) {
          throw const UnexpectedFailure("The error was not expected");
        }
        return Right("Success to update Course id: $id");
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
