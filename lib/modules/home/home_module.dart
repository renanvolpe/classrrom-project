import 'package:classroom_project/modules/home/presentation/screen/home_page.dart';
import 'package:classroom_project/modules/home/presentation/screen/student_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/students', child: (context) => const StudentPage());
  }
}
