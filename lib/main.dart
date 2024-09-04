import 'package:classroom_project/app_module.dart';
import 'package:classroom_project/database/sqlite_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(ModularApp(
    module: AppModule(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() async {
    await Modular.get<SqliteConfig>().initDatabase();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Classroom App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
