import 'package:classroom_project/modules/home/data/datasource/abstract_student_datasource.dart';
import 'package:classroom_project/modules/home/presentation/mobx/student/add_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/student/delete_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/student/edit_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/student/get_student_controller.dart';
import 'package:classroom_project/modules/home/presentation/mobx/student/student_controller.dart';
import 'package:classroom_project/modules/home/presentation/screen/home_page.dart';
import 'package:classroom_project/modules/home/presentation/screen/student_page.dart';
import 'package:classroom_project/modules/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/student_datasource.dart';
import 'data/repository/student_repository_impl.dart';
import 'domain/repository/abstract_student_repository.dart';
import 'domain/usecase/student_usecase.dart';
import 'presentation/mobx/student/get_all_student_controller.dart';
import 'presentation/widgets/overlay_internet.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/students', child: (context) => const StudentPage());
  }

  @override
  void binds(Injector i) {
    //START - STUDENT CRUD
    i.addSingleton<IStudentLocalDataSource>(StudentLocalDataSource.new);
    i.addSingleton<IStudentRepository>(StudentRepositoryImpl.new);

    i.addSingleton(GetAllStudentsUsecase.new);
    i.addSingleton(GetAllStudentsController.new);

    i.addSingleton(AddStudentUsecase.new);
    i.addSingleton(AddStudentController.new);

    i.addSingleton(EditStudentUsecase.new);
    i.add(EditStudentController.new);

    i.addSingleton(DeleteStudentUsecase.new);
    i.add(DeleteStudentController.new);

    i.addSingleton(GetStudentUsecase.new);
    i.addSingleton(GetStudentController.new);

    i.addSingleton(StudentController.new);
    //FINISH - STUDENT CRUD

    i.addSingleton(SlidingPanelController.new);

    super.binds(i);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
