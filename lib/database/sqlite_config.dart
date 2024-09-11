import 'package:classroom_project/database/classrom_fields.dart';
import 'package:classroom_project/database/classroom_tables.dart';
import 'package:classroom_project/database/type_fields.dart';
import 'package:sqflite/sqflite.dart';

class SqliteConfig {

  static Database? _database;

  Database get database => _database!;

  Future<void> initDatabase([bool? isToRecreate]) async {
    try {
      final databasePath = await getDatabasesPath();
      final path = '$databasePath/classroom.db';

      var openedDatabase = await openDatabase(
        path,
        version: 1,
        onCreate:  (db, v) async => await _createDatabase(db, 1),
      );

      _database = openedDatabase;

      if (isToRecreate == true) {
        await _recreateDB(_database!);
        await initDatabase();
      }
    } catch (e) {
      throw Error();
    }
  }

  Future<void> _recreateDB(Database database) async {
    await _dropTables(database);
    await _createDatabase(database, 1);
  }

  Future<void> _dropTables(Database database) async {
    try {
      await database.execute('DROP TABLE IF EXISTS ${ClassroomTables.course}');
      await database.execute('DROP TABLE IF EXISTS ${ClassroomTables.student}');
      await database.execute('DROP TABLE IF EXISTS ${ClassroomTables.courseStudent}');
    } catch (e) {
      print('Error dropping table: $e');
    }
  }

  Future<void> _createDatabase(Database db, int version) async {
    String queryCreateTable = '''
       

         CREATE TABLE ${ClassroomTables.student} (
          ${ClassromFields.id} ${TypeFields.idPrymaryType},
           ${ClassromFields.name} ${TypeFields.varcharType}
        );

           CREATE TABLE ${ClassroomTables.course} (
          ${ClassromFields.id} ${TypeFields.idPrymaryType},
          ${ClassromFields.description} ${TypeFields.varcharType},
          ${ClassromFields.syllabus} ${TypeFields.textType}
        );

        CREATE TABLE ${ClassroomTables.courseStudent} (
         ${ClassromFields.id} ${TypeFields.idPrymaryType},
          ${ClassromFields.idStudent} ${TypeFields.idType},
          ${ClassromFields.idCourse} ${TypeFields.idType}
          FOREIGN KEY (${ClassromFields.idStudent} REFERENCES ${ClassroomTables.student}(${ClassromFields.id}),
          FOREIGN KEY (${ClassromFields.idCourse}) REFERENCES ${ClassroomTables.course}(${ClassromFields.id})
        );
      ''';

    return await db.execute(queryCreateTable);
  }

  Future<void> _alterDatabase(Database db, int version) async {
    String queryUpdateTable = '''
        ALTER TABLE ${ClassroomTables.course} (
          ${ClassromFields.id} ${TypeFields.idPrymaryType},
          ${ClassromFields.description} ${TypeFields.varcharType},
          ${ClassromFields.syllabus} ${TypeFields.textType}
        );

         ALTER TABLE ${ClassroomTables.student} (
          ${ClassromFields.id} ${TypeFields.idPrymaryType},
           ${ClassromFields.name} ${TypeFields.varcharType}
        );

        ALTER TABLE ${ClassroomTables.courseStudent} (
         ${ClassromFields.id} ${TypeFields.idPrymaryType},
          ${ClassromFields.idStudent} ${TypeFields.idType},
          ${ClassromFields.idCourse} ${TypeFields.idType}
        );
      ''';

    return await db.execute(queryUpdateTable);
  }
}
