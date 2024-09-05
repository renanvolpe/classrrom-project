import 'package:classroom_project/modules/home/presentation/widgets/icon_delete_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entity/student.dart';
import '../mobx/student_controller.dart';
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
                          onTap: () {},
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
}
