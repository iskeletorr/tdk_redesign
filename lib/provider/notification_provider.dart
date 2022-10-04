import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier {
  List<RemoteMessage?> notificationList = [];

  void addNotiList(RemoteMessage? message) {
    notificationList.add(message);
    notifyListeners();
  }

  List<RemoteMessage?> get notiList => notificationList; // list.from
}
