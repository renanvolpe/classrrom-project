import 'package:classroom_project/database/sqlite_config.dart';
import 'package:classroom_project/database/student_crud.dart';
import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

void main() async{
  late Database database;
  late StudentCrud studentCrud;
  
  sqfliteTestInit();
  
  setUpAll(() async {
    // Maybe delete the database here
    database = await SqliteConfig.instance.getDatabase(true);
    studentCrud = StudentCrud(database);
  });

  group("Test all functions of crud local student", () {
 
    late int idCreated;

    test("test create local student", () async {
      String studentName = "NewName3";
      idCreated = await studentCrud.create(studentName);
      expect(idCreated, isA<int>());
    });
    test("test get all local student", () async {
      var response = await studentCrud.readAll();
      expect(response, isA<List<StudentEntity>>());
    });

    test("test get local student", () async {
      var student = await studentCrud.read(idCreated);
      expect(student, isA<StudentEntity>());
    });

    test("test get local student", () async {
      var newStudent = StudentEntity(id: idCreated, name: "updated name");
      var response = await studentCrud.update(newStudent);
       expect(response, isA<int>());
    });

    test("test delete local student", () async {
      var response = studentCrud.delete(idCreated);
      expect(response, isA<int>());
    });

  });
}
