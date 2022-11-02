import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with SingleTickerProviderStateMixin {
  int seconds = 0;
  // late Timer timer;
  // @override
  // void initState() {
  //   super.initState();
  //   FlutterNativeSplash.remove();
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) => updateTime());
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(child: Text('$seconds')),
  //   );
  // }

  // updateTime() {
  //   if (seconds == 15) timer.cancel();
  //   seconds++;
  //   setState(() {});
  // }

  // @override
  // void dispose() {
  //   if (timer.isActive) timer.cancel();
  //   super.dispose();
  // }
  late Ticker ticker;
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation = Tween<int>(begin: 0, end: 15).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    // ticker = createTicker((elapsed) {
    //   if (seconds == 65) ticker.stop();

    //   seconds++;
    // });
    // ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: controller.value,
                    valueColor: AlwaysStoppedAnimation(Colors.red.withOpacity(controller.value)),
                  ))),
          Center(child: Text('${(controller.value * 100).toInt()}')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    ticker.dispose();
    controller.dispose();
    super.dispose();
  }
}
