

import 'package:dartz/dartz.dart';

import '../../../shared/failure.dart';
import '../entity/course.dart';

abstract class ICourseRepository {
  //crud student
  Future<Either<Failure, List<CourseEntity>?>> getAllCourses();
  Future<Either<Failure, CourseEntity>> getCourse(int id);
  Future<Either<Failure, int?>> addCourse(String name);
  Future<Either<Failure, int?>> deleteCourse(int id);
  Future<Either<Failure, int?>> editCourse(CourseEntity student);
}
