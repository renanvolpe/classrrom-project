import 'package:classroom_project/database/sqlite_config.dart';
import 'package:classroom_project/modules/home/data/datasource/course_dto_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

void main() async {
  late CourseLocalDataSource courseLocalDataSource;

  sqfliteTestInit();

  setUpAll(() async {
    var sqlite = SqliteConfig();
    // Maybe delete the database here
    await sqlite.initDatabase();
    courseLocalDataSource = CourseLocalDataSource(sqlite);
  });

  group("Test all functions of crud local course", () {
    late int idCreated;

      test("test create local course", () async {
      String description = "description 1";
      String ementa = "ementa 1";
      var response = await courseLocalDataSource.addCourse(description, ementa);

      idCreated = response.toOption().toNullable()!;

      response.fold((failure) {}, (success) {
        expect(idCreated, isA<int>());
      });
    });
    test("test get all local course", () async {
      var response = await courseLocalDataSource.getAllCourses();
      expect(response, isInstanceOf<Right>());
    });

    test("test get local course", () async {
      var response = await courseLocalDataSource.getCourse(idCreated);

      expect(response, isInstanceOf<Right>());
    });

    test("test delete local course", () async {
      var response = await courseLocalDataSource.deleteCourse(idCreated);

      response.fold((failure) {}, (success) {
        expect(idCreated, isA<int>());
      });
    });
  });
}
