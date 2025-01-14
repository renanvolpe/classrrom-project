import 'package:classroom_project/modules/internet/internet_connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/screen/has_no_internet_dialog.dart';

class InternetModule extends Module {
  @override
  void exportedBinds(Injector i) {
    
    i.add(() => Connectivity());
    i.addSingleton(() async => await InternetConnectivity(Modular.get()).init());
    i.addSingleton(InternetConnectivity.new);

    super.exportedBinds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const InternetConnectivityDialog(), guards: []);
    super.routes(r);
  }
}
