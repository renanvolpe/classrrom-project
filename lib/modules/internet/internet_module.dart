import 'package:classroom_project/modules/internet/internet_connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InternetModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(() => Connectivity());
    i.addSingleton(InternetConnectivity.new);
    super.exportedBinds(i);
  }
}
