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
  late StudentLocalDataSource studentLocalDataSource;

  sqfliteTestInit();

  setUpAll(() async {
    var sqlite = SqliteConfig();
    // Maybe delete the database here
    await sqlite.initDatabase();
    studentLocalDataSource = StudentLocalDataSource(sqlite);
  });

  group("Test all functions of crud local student", () {
    late int idCreated;

    test("test create local student", () async {
      String studentName = "NewName3";
      var response = await studentLocalDataSource.addStudent(studentName);

      idCreated = response.toOption().toNullable()!;

      response.fold((failure) {}, (success) {
        expect(idCreated, isA<int>());
      });
    });
    test("test get all local student", () async {
      var response = await studentLocalDataSource.getAllStudents();
      expect(response, isInstanceOf<Right>());
    });

    test("test get local student", () async {
      var response = await studentLocalDataSource.getStudent(idCreated);

      expect(response, isInstanceOf<Right>());
    });

    // test("test get local student", () async {
    //   var newStudent = StudentEntity(id: idCreated, name: "updated name");
    //   var response = await studentLocalDataSource. update(newStudent);
    //   expect(response, isA<int>());
    // });

    test("test delete local student", () async {
      var response = await studentLocalDataSource.deleteStudent(idCreated);

      response.fold((failure) {}, (success) {
        expect(idCreated, isA<int>());
      });
    });
  });
}
