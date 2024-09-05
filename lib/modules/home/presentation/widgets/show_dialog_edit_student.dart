import 'package:classroom_project/modules/home/presentation/mobx/student_controller.dart';
import 'package:classroom_project/shared/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entity/student.dart';
import '../mobx/edit_student_controller.dart';

Future<dynamic> showDialogEditStudent(BuildContext context, StudentEntity student) {
  EditStudentController controllerEdit = Modular.get<EditStudentController>();
  TextEditingController nameStudentText = TextEditingController(text: student.name);
  var controller = Modular.get<StudentController>();
  return showDialog(
      context: context,
      builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                title: const Text("Edit Student here"),
                content: Column(
                  children: [
                    TextFormField(
                      controller: nameStudentText,
                    ),
                    const SizedBox(height: 15),
                    Observer(builder: (_) {
                      if (controllerEdit.state == AppState.inProgress) {
                        return const CircularProgressIndicator();
                      }
                      return TextButton(
                          onPressed: () async {
                            student.name = nameStudentText.text;
                            await controllerEdit.editStudents(student);
                            if (controllerEdit.status == AppState.success) {
                              controller.editStudent(student);
                              Modular.to.pop();
                            }
                          },
                          child: const Icon(Icons.edit, color: Colors.green));
                    })
                  ],
                ),
              )
            ],
          ));
}
