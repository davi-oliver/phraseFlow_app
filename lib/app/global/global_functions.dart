import 'package:connectivity/connectivity.dart';

class VerificaInternet {
  Future<bool> result(context) async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      return true;
    }
    return false;
  }
}
