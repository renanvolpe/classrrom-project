import 'package:classroom_project/modules/home/presentation/mobx/get_all_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/student_controller.dart';
import 'package:classroom_project/modules/shared/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/show_dialog_add_student.dart';
import '../widgets/success_getall_student_widget.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late GetAllStudentsController controllerGetAll;

  late StudentController controller;

  @override
  void initState() {
    controllerGetAll = Modular.get<GetAllStudentsController>();
    controller = Modular.get<StudentController>();

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    var result = await controllerGetAll.getAllStudents();
    controller.getAllStudents(result);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await showDialogAddStudent(context),
        child: const Icon(Icons.person_add),
      ),
      appBar: AppBar(
        title: const Text("Student Section"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    var list = await controllerGetAll.getAllStudents();
                    controller.getAllStudents(list);
                  },
                  child: const Text("Search again students")),
            ],
          ),
          Observer(
            builder: (_) => switch (controllerGetAll.status) {
              (AppState.initial || AppState.inProgress) => const CircularProgressIndicator(),
              (AppState.success) => const SuccessGetAllStudentWidget(),
              (AppState.failure) => Text('Falha na requisição: ${controllerGetAll.errorMessage}'),
            },
          ),
        ],
      ),
    );
  }
}
