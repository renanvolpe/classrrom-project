

import 'package:dartz/dartz.dart';

import '../../../shared/failure.dart';
import '../../domain/entity/course.dart';

abstract class ICourseLocalDataSource {
  Future<Either<Failure, List<CourseEntity>?>> getAllCourses();
  Future<Either<Failure, CourseEntity>> getCourse(int id);
  Future<Either<Failure, int>> addCourse(String description, String ementa);
   Future<Either<Failure, int>> deleteCourse(int id);
  Future<Either<Failure, int>> editCourse(CourseEntity student);
}
