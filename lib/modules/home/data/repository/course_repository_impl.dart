
import 'package:classroom_project/modules/shared/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entity/course.dart';
import '../../domain/repository/abtract_course_repository.dart';
import '../datasource/abstract_course_dto.dart';

class CourseRepositoryImpl implements ICourseRepository {
  // final ICourseRemoteDataSource studentRemoteDataSource;

  final ICourseLocalDataSource _studentLocalDataSource;
  CourseRepositoryImpl({
    required ICourseLocalDataSource datasource,
  }) : _studentLocalDataSource = datasource;

  @override
  Future<Either<Failure, int?>> addCourse(String name) async {
    try {
      var response = await _studentLocalDataSource.addCourse(name, name);

      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int?>> deleteCourse(int id) async {
    try {
      var response = await _studentLocalDataSource.deleteCourse(id);
      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>?>> getAllCourses() async {
    try {
      var response = await _studentLocalDataSource.getAllCourses();
      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourse(int id) async {
    var response = await _studentLocalDataSource.getCourse(id);
    try {
      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> editCourse(CourseEntity student) async {
    var response = await _studentLocalDataSource.editCourse(student);
    try {
      return response.fold((failure) => Left(failure), (success) => Right(success));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
