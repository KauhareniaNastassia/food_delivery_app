import 'package:core/core.dart';

class CheckInternetConnection {
  CheckInternetConnection();

  static Future<bool> checkIsInternetConnectionAvailable() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    return connectivityResult == ConnectivityResult.none ? false : true;
  }
}
