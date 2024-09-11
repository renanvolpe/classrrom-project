import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  // late GetAllStudentsController controllerGetAll;

  // late StudentController controller;

  @override
  void initState() {
    // controllerGetAll = Modular.get<GetAllStudentsController>();
    // controller = Modular.get<StudentController>();

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // var result = await controllerGetAll.getAllStudents();
    // controller.getAllStudents(result);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {}, // await showDialogAddStudent(context),
        child: const Icon(Icons.person_add),
      ),
      appBar: AppBar(
        title: const Text("Course Section"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    // var list = await controllerGetAll.getAllStudents();
                    // controller.getAllStudents(list);
                  },
                  child: const Text("Search again Courses")),
            ],
          ),
          // Observer(
          //   builder: (_) => switch (controllerGetAll.status) {
          //     (AppState.initial || AppState.inProgress) => const CircularProgressIndicator(),
          //     (AppState.success) => const SuccessGetAllStudentWidget(),
          //     (AppState.failure) => Text('Falha na requisição: ${controllerGetAll.errorMessage}'),
          //   },
          // ),
        ],
      ),
    );
  }
}
