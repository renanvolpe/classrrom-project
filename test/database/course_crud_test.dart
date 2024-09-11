import 'package:classroom_project/database/sqlite_config.dart';
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
  });
}
