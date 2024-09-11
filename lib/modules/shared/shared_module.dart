import 'package:classroom_project/database/sqlite_config.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton(() async => await SqliteConfig().initDatabase());
    i.addSingleton(SqliteConfig.new);
    super.exportedBinds(i);
  }
}
