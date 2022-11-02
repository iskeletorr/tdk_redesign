import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:math' as math;

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Column(
            children: const [
              Icon(Icons.menu, color: Colors.white),
            ],
          ),
          title: Column(
            children: const [
              Text(
                'FLOW',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 30)
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TabBar(
                  indicatorColor: Colors.transparent,
                  labelStyle: TextStyle(fontSize: 18),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.white30,
                  tabs: [
                    Tab(text: 'Static', icon: Icon(Icons.boy_rounded, size: 35)),
                    Tab(text: 'Walking', icon: Icon(Icons.directions_walk, size: 35)),
                    Tab(text: 'Running', icon: Icon(Icons.directions_run_rounded, size: 35)),
                    Tab(text: 'Cycling', icon: Icon(Icons.directions_bike_outlined, size: 35)),
                  ]),
              Expanded(
                child: TabBarView(
                    children: [Container(color: Colors.blue), walkingView(context), Container(color: Colors.red), Container(color: Colors.green)]),
              )
            ],
          ),
        ));
  }

  Column walkingView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Container(
            height: 130,
            width: 130,
            child: CustomPaint(
              painter: CircularPainter(65, 0.35),
            )),
        // CircularPercentIndicator(
        //   radius: 130.0,
        //   animation: true,
        //   animationDuration: 1200,
        //   lineWidth: 15.0,
        //   percent: 0.35,
        //   center: RichText(
        //     text: const TextSpan(
        //       text: "35%",
        //       children: [TextSpan(text: '\n of 2.000ml', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25, color: Colors.white54))],
        //       style: TextStyle(fontWeight: FontWeight.w400, fontSize: 70.0, color: Colors.white),
        //     ),
        //   ),
        //   circularStrokeCap: CircularStrokeCap.round,
        //   backgroundColor: Colors.grey.shade900,
        //   progressColor: Colors.cyan,
        // ),
        const SizedBox(height: 40),
        RichText(text: const TextSpan(text: 'You drank 10.200ml of water today', style: TextStyle(fontSize: 18))),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/wave-of-particles.jpg',
              fit: BoxFit.fitWidth,
            )),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.cyan,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'View Hydration History',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300),
            ),
          ),
        )
      ],
    );
  }
}

class CircularPainter extends CustomPainter {
  final double radius;
  final double value;
  CircularPainter(this.radius, this.value);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = Colors.grey.shade900;
    final Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);
    final Paint valuePaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = Colors.cyan
      ..shader = const SweepGradient(colors: [Colors.green, Colors.red]).createShader(rect);

    canvas.drawArc(rect, 0, math.pi * 2, false, paint);
    canvas.drawArc(rect, -(3.14 / 2), (3.14 * 2) * value, false, valuePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
