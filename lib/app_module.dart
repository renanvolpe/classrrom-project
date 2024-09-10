import 'package:classroom_project/core/app_service.dart';
import 'package:classroom_project/modules/home/home_module.dart';
import 'package:classroom_project/modules/internet/internet_connectivity.dart';
import 'package:classroom_project/modules/internet/internet_module.dart';
import 'package:classroom_project/modules/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/internet/presentation/screen/has_no_internet_dialog.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AppService.new);
  }

  @override
  List<Module> get imports => [SharedModule(), InternetModule()];

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule(), guards: [InternetGuard()]);
    r.child('/noInternet', child: (_) => const InternetConnectivityDialog());
  }
}

class InternetGuard extends RouteGuard {
  InternetGuard() : super(redirectTo: '/noInternet');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return Modular.get<InternetConnectivity>().hasConnection; //when has no connection
  }
}
