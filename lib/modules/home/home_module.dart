import 'package:classroom_project/modules/home/data/datasource/abstract_student_datasource.dart';
import 'package:classroom_project/modules/home/presentation/screen/home_page.dart';
import 'package:classroom_project/modules/home/presentation/screen/student_page.dart';
import 'package:classroom_project/modules/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/student_datasource.dart';
import 'data/repository/student_repository_impl.dart';
import 'domain/repository/abstract_student_repository.dart';
import 'domain/usecase/student_usecase.dart';
import 'presentation/mobx/get_all_student_controller.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/students', child: (context) => const StudentPage());
  }

  @override
  void binds(Injector i) {
    i.addSingleton<IStudentLocalDataSource>(StudentLocalDataSource.new);
    i.addSingleton<IStudentRepository>(StudentRepositoryImpl.new);
    i.addSingleton(GetAllStudentsUsecase.new);
    i.addSingleton(GetAllStudentsController.new);

    super.binds(i);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
