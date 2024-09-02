import 'package:classroom_project/core/dartz_as.dart';
import 'package:classroom_project/database/sqlite_config.dart';
import 'package:classroom_project/modules/home/data/datasource/student_datasource.dart';
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
  late Database database;
  late StudentLocalDataSource studentLocalDataSource;

  sqfliteTestInit();

  setUpAll(() async {
    // Maybe delete the database here
    await SqliteConfig.instance.initDatabase();
    database = SqliteConfig.instance.database;
    studentLocalDataSource = StudentLocalDataSource(database);
  });

  group("Test all functions of crud local student", () {
    late int idCreated;

    test("test create local student", () async {
      String studentName = "NewName3";
      var response = await studentLocalDataSource.addStudent(studentName);

      idCreated = response.asRight();
      expect(idCreated, isA<Right>());
    });
    test("test get all local student", () async {
      var response = await studentLocalDataSource.getAllStudents();
      expect(response, isA<Right>());
    });

    test("test get local student", () async {
      var response = await studentLocalDataSource.getStudent(idCreated);

      expect(response, isA<Right>());
    });

    // test("test get local student", () async {
    //   var newStudent = StudentEntity(id: idCreated, name: "updated name");
    //   var response = await studentLocalDataSource. update(newStudent);
    //   expect(response, isA<int>());
    // });

    test("test delete local student", () async {
      var response = studentLocalDataSource.deleteStudent(idCreated);
      expect(response, isA<int>());
    });
  });
}
