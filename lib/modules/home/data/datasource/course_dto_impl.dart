import 'package:dartz/dartz.dart';

import '../../../../database/classrom_fields.dart';
import '../../../../database/classroom_tables.dart';
import '../../../../database/sqlite_config.dart';
import '../../../shared/failure.dart';
import '../../domain/entity/course.dart';
import 'abstract_course_dto.dart';

class CourseLocalDataSource implements ICourseLocalDataSource {
  final SqliteConfig _sqliteConfig;

  CourseLocalDataSource(this._sqliteConfig);

  @override
  Future<Either<Failure, int>> addCourse(String courseName) async {
    var json = {ClassromFields.name: courseName};
    try {
      final id = await _sqliteConfig.database.insert(ClassroomTables.course, json);
      return Right(id);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteCourse(int id) async {
    try {
      final newId = await _sqliteConfig.database.delete(
        ClassroomTables.course,
        where: '${ClassromFields.id} = ?',
        whereArgs: [id],
      );
      return Right(newId);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>?>> getAllCourses() async {
    try {
      final result = await _sqliteConfig.database.query(ClassroomTables.course);
      List<CourseEntity>? listCourses = result.map((json) => _toCourseEntity(json)).toList();
      return Right(listCourses);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourse(int id) async {
    try {
      List<Map<String, Object?>> maps = await _sqliteConfig.database.query(
        ClassroomTables.course,
        where: '${ClassromFields.id} = ?',
        whereArgs: [id],
      );
      return Right(_toCourseEntity(maps.first));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> editCourse(CourseEntity course) async {
    try {
      var mapTpUpdate = {ClassromFields.description: course.descricao, ClassromFields.text: course.text};
      var maps = await _sqliteConfig.database.update(
        ClassroomTables.course,
        mapTpUpdate,
        where: '${ClassromFields.id} = ?',
        whereArgs: [course.id],
      );
      return Right(maps);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}

CourseEntity _toCourseEntity(Map<String, Object?> json) {
  return CourseEntity(id: json["code"] as int, descricao: json["descricao"] as String, text: json["text"] as String);
}
