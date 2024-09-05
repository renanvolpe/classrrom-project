
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/state_mixin.dart';
import '../../domain/entity/student.dart';
import '../mobx/delete_student_controller.dart';
import '../mobx/student_controller.dart';

class IconDeleteStudent extends StatelessWidget {
  const IconDeleteStudent({
    super.key,
    required this.student,
  });

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    var controllerDelete = Modular.get<DeleteStudentController>();
    var controller = Modular.get<StudentController>();
    return Observer(builder: (_) {
      return IconButton(
          onPressed: () async {
            await controllerDelete.deleteStudent(student.id);
            if (controllerDelete.status == AppState.success) {
              controller.deleteStudent(student.id);
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
