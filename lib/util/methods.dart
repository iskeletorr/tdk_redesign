import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


 Future<void> firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
    print('${message?.data['view']}');
    print("Handling a background message: ${message?.messageId}");
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: message?.notification?.title,
          body: message?.notification?.body,
          payload: {'click_action': 'FLUTTER_NOTIFICATION_CLICK', 'view': 'history'}),
    );
    // print(message?.data['view'] == 'history');
    // if (message?.data['view'] == 'history') {
      // Navigator.pushNamed(
      //   bcontext,
      //   '/dashboard/history',
      //   arguments: message,
      // );
      // bcontext.router.navigateNamed('/dashboard/history');
    // }
  }