import 'package:flutter/material.dart';

import '../util/connectivity_x.dart';

class ConnectivityProvider with ChangeNotifier {
  void checkConnection(BuildContext context) {
    NetworkAwareState(context).initStateSubs();
    notifyListeners();
  }

  void closeConnection(BuildContext context) {
    NetworkAwareState(context).cancelSubscription();
    notifyListeners();
  }
}
