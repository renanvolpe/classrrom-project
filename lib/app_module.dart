import 'package:classroom_project/core/app_service.dart';
import 'package:classroom_project/modules/home/home_module.dart';
import 'package:classroom_project/modules/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AppService.new);
  }

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [SharedModule()];

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
  }
}
