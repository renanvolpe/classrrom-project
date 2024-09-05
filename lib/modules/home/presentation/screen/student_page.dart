import 'package:classroom_project/modules/home/domain/entity/student.dart';
import 'package:classroom_project/modules/home/presentation/mobx/add_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/delete_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/get_all_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/student_controller.dart';
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
        onPressed: () async {
          await showDialogAddStudent(context);
        },
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
          const SizedBox(
            height: 30,
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

  Future<dynamic> showDialogAddStudent(BuildContext context) {
    TextEditingController nameStudentText = TextEditingController();
    AddStudentController controllerAdd = Modular.get<AddStudentController>();
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Add a Student"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameStudentText,
                    decoration: const InputDecoration(hintText: "Put new name here"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(onPressed: () async {
                    var newStudent = await controllerAdd.addStudent(nameStudentText.text);
                    if (controllerAdd.status == AppState.success) {
                      controller.addStudent(newStudent);
                      Modular.to.pop();
                    }
                  }, child: Observer(builder: (_) {
                    if (controllerAdd.status == AppState.inProgress) return const CircularProgressIndicator();
                    return const Text("Add here");
                  }))
                ],
              ),
            ));
  }
}

class SuccessGetAllStudentWidget extends StatelessWidget {
  const SuccessGetAllStudentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
    List<StudentEntity> listStudent = Modular.get<StudentController>().listStudent;
      return Expanded(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.lightBlue[50]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sucesso na requisição, quantaide de alunos: ${listStudent.length}'),
              const SizedBox(height: 30),
              const Text('Students:'),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (_, i) => const SizedBox(height: 10),
                    itemCount: listStudent.length,
                    itemBuilder: (_, index) {
                      return Center(
                          child: Row(
                        children: [
                          Text("Name Student: ${listStudent[index].name} | id Student: ${listStudent[index].id}"),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person,
                                color: Colors.green,
                              )),
                          IconDeleteStudent(student: listStudent[index])
                        ],
                      ));
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}

class IconDeleteStudent extends StatelessWidget {
  const IconDeleteStudent({
    super.key,
    required this.student,
  });

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    // var controllerGetAll = Modular.get<GetAllStudentsController>();
    var controllerDelete = Modular.get<DeleteStudentController>();
    return Observer(builder: (_) {
      return IconButton(
          onPressed: () async {
            await controllerDelete.deleteStudent(student.id);
            if (controllerDelete.status == AppState.success) {
              // controllerGetAll.removeStudent(student.id);
              // controllerGetAll.userListFuture.removeWhere((e) => e.id == student.id);
              // await controllerGetAll.getAllStudents();
            }
          },
          icon: controllerDelete.status == AppState.inProgress && student.id == controllerDelete.idDeleting
              ? const CircularProgressIndicator()
              : const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ));
    });
  }
}
