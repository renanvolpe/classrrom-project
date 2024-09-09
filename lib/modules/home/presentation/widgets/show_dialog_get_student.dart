import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../shared/state_mixin.dart';
import '../../domain/entity/student.dart';
import '../mobx/get_student_controller.dart';

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
