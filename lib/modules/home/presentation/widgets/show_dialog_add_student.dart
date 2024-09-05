
 import 'package:classroom_project/modules/home/presentation/mobx/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/state_mixin.dart';
import '../mobx/add_student_controller.dart';

Future<dynamic> showDialogAddStudent(BuildContext context) {
    TextEditingController nameStudentText = TextEditingController();
    AddStudentController controllerAdd = Modular.get<AddStudentController>();
    var controller = Modular.get<StudentController>();
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