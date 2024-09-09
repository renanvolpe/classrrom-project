// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  final Connectivity _connectivity;
  late ConnectivityResult _connectivityResult;
  bool _isConnected = false;

  InternetConnectivity(this._connectivity);

  bool get hasConnection => _isConnected;

  Future<void> init() async {
    var listResult = await _connectivity.checkConnectivity();
    _connectivityResult = listResult.first;
    isInternetConnected(_connectivityResult);

    _connectivity.onConnectivityChanged.listen((result) {
      isInternetConnected(result.first);
    });
  }

  bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      _isConnected = false;
      return false;
    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      _isConnected = true;
      return true;
    }
    return false;
  }
}
