//import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class CheckNetwork{
  var connectivityResult;
  static CheckNetwork checkNetwork = CheckNetwork();

  check()async{
    connectivityResult  = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}