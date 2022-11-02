import 'dart:developer' as dev;
import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class AlarmView extends StatefulWidget {
  const AlarmView({super.key});

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  bool isActive = true;
  late DateTime val;
  late int id;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    AndroidAlarmManager.initialize();
  }

  @pragma('vm:entry-point')
  static Future<void> callback() async {
    dev.log('Alarm fired!');
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Alarm fired!',
        body: DateTime.now().toString(),
        payload: {'click_action': 'FLUTTER_NOTIFICATION_CLICK', 'view': 'history'},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle, boxShadow: [BoxShadow(blurRadius: 25, spreadRadius: 160, color: Colors.blue, offset: Offset(0, 0))]),
              //   width: 345.w,
              //   child: CustomPaint(painter: MyPainter()),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        await AndroidAlarmManager.cancel(id);
                        dev.log('Cancelled alarm with $id id');
                      },
                      icon: Icon(Icons.cancel_outlined)),
                  Text(
                    'Edit alarm',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () async {
                        await AndroidAlarmManager.oneShot(
                          val.difference(DateTime.now()),
                          // Ensure we have a unique alarm ID.
                          id = Random().nextInt(pow(2, 31) as int),
                          callback,
                          exact: true,
                          wakeup: true,
                        );
                      },
                      icon: Icon(
                        Icons.done,
                        color: Colors.yellow.shade700,
                      ))
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  backgroundColor: Color(0xFF112434).withOpacity(0.9),
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (value) {
                    val = value;
                  },
                ),
              ),
              // ElevatedButton(
              //   key: const ValueKey('RegisterOneShotAlarm'),
              //   onPressed: () async {
              //     await AndroidAlarmManager.oneShot(
              //       val,
              //       // Ensure we have a unique alarm ID.
              //       Random().nextInt(pow(2, 31) as int),
              //       callback,
              //       exact: true,
              //       wakeup: true,
              //     );
              //   },
              //   child: const Text(
              //     'Schedule OneShot Alarm',
              //   ),
              // ),
            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 50, 51, 53)
      ..strokeCap = StrokeCap.round;
    final paint2 = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round;
    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 150, paint);
    canvas.drawCircle(center, 130, paint2);

    var paint3 = Paint()..color = Colors.white; /////////
    for (int i = 0; i < 60; i++) {
      double minute = 360 / 60 * i;
      paint.strokeWidth = (i % 5 == 0) ? 3 : 1;

      int distance = (i % 5 == 0) ? 20 : 5; ////////

      double x1 = (size.width / 2) + (size.width / 3 + distance) * cos(vector.radians(minute));
      double y1 = (size.height / 2) + (size.width / 3 + distance) * sin(vector.radians(minute));
      final p1 = Offset(x1, y1);

      double x2 = (size.width / 2) + (size.width / 3 + 30) * cos(vector.radians(minute));
      double y2 = (size.height / 2) + (size.width / 3 + 30) * sin(vector.radians(minute));
      final p2 = Offset(x2, y2);

      if (i % 5 == 0) {
        /////////////
        canvas.drawLine(p1, p2, paint3);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
