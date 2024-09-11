import 'package:classroom_project/modules/home/presentation/mobx/student/get_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/widgets/icon_delete_student.dart';
import 'package:classroom_project/modules/shared/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../domain/entity/student.dart';
import '../mobx/student/student_controller.dart';
import 'show_dialog_edit_student.dart';

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
                      return Observer(builder: (_) {
                        return ListTile(
                          onTap: () async {
                            var getStudentController = Modular.get<GetStudentController>();
                            getStudentController.getStudents(listStudent[index].id);
                            await showDialogGetStudent(_, getStudentController, listStudent[index]);
                          },
                          title:
                              Text("Name Student: ${listStudent[index].name} | id Student: ${listStudent[index].id}"),
                          leading: const Icon(Icons.person),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await showDialogEditStudent(context, listStudent[index]);
                                  },
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: Colors.green,
                                  )),
                              IconDeleteStudent(student: listStudent[index])
                            ],
                          ),
                        );
                      });
                    }),
              )
            ],
          ),
        ),
      );
    });
  }

  Future<dynamic> showDialogGetStudent(_, GetStudentController getStudentController, StudentEntity student) {
    var getStudentController = Modular.get<GetStudentController>();
    return showDialog(
      context: (_),
      builder: (context) {
        return Observer(builder: (_) {
          if (getStudentController.status == AppState.inProgress) {
            return const AlertDialog(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [CircularProgressIndicator()],
              ),
            );
          }
          return AlertDialog(
            title: Text("ID Student: ${student.id}"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [Text("Name Student: ${student.name} "), const Gap(25), const Text("Courses registred:")],
            ),
          );
        });
      },
    );
  }
}
