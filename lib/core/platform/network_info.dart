import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/core/error/exceptions.dart';

abstract class NetworkInfo {
  Future<bool> checkConnection();
}

class NetworkInfoImplementation extends NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImplementation(this.connectivity);

  @override
  Future<bool> checkConnection() async {
    final ConnectivityResult result = await connectivity.checkConnectivity();
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.none:
      default:
        throw ConnectivityException();
    }
  }
}
