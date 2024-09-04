import 'package:classroom_project/database/sqlite_config.dart';
import 'package:classroom_project/modules/home/data/datasource/student_datasource.dart';
import 'package:classroom_project/modules/home/data/repository/student_repository_impl.dart';
import 'package:classroom_project/modules/home/domain/usecase/student_usecase.dart';
import 'package:classroom_project/modules/home/presentation/mobx/get_all_student_controller.dart';
import 'package:classroom_project/shared/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late GetAllStudentsController controller;

  @override
  void initState() {
    var localDatasource = StudentLocalDataSource(Modular.get<SqliteConfig>());
    var studentRepository = StudentRepositoryImpl(datasource: localDatasource);
    var getAllStudentUsecase = GetAllStudentsUsecase(repository: studentRepository);

    controller = GetAllStudentsController(getAllStudentUsecase);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Section"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
            builder: (_) => switch (controller.status) {
              (AppState.initial) => const Text("initial"),
              (AppState.success) =>
                Text('Sucesso na requisição, quantaide de alunos: ${controller.userListFuture.length}'),
              (AppState.failure) => Text('Falha na requisição: ${controller.errorMessage}'),
              (AppState.inProgress) => const CircularProgressIndicator(),
            },
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    controller.getAllStudents();
                  },
                  child: const Text("Alunos2")),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}
