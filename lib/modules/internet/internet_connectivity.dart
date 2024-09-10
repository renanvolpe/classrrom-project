// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'internet_connectivity.g.dart';

class InternetConnectivity = InternetConnectivityBase with _$InternetConnectivity;

abstract class InternetConnectivityBase with Store {
  final Connectivity _connectivity;

  InternetConnectivityBase(this._connectivity);

  @observable
  bool isConnected = true;

  @computed
  bool get hasConnection => isConnected;

  @action
  Future<void> init() async {
    var listResult = await _connectivity.checkConnectivity();
    var connectivityResult = listResult.first;
    isInternetConnected(connectivityResult);

    _connectivity.onConnectivityChanged.listen((result) {
      isInternetConnected(result.first);
    });
  }

  @action



  @action
  void isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      isConnected = false;
    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      isConnected = true;
    }
  }
}
