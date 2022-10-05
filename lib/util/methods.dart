import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingHandler(RemoteMessage? message) async {
  print('${message?.data['view']}');
  print("Handling a message: ${message?.messageId}");
}
