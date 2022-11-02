import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:practice_1/home/progress/progress.dart';

class AlarmDetail extends StatefulWidget {
  const AlarmDetail({super.key});

  @override
  State<AlarmDetail> createState() => _AlarmDetailState();
}

class _AlarmDetailState extends State<AlarmDetail> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const Icon(Icons.stacked_line_chart, color: Colors.grey),
              actions: [
                Container(
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(15), color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 305,
            height: 305,
            child: Stack(
              children: [
                CustomPaint(painter: ClockPainter(150, 0.5)),
                const Positioned(
                  left: 150,
                  top: -5,
                  child: Material(
                    color: Colors.deepOrange,
                    shape: CircleBorder(),
                    elevation: 5,
                    child: Icon(Icons.doorbell),
                    // IconButton(
                    //   icon: Icon(Icons.doorbell),
                    //   onPressed: () {},
                    // ),
                  ),
                ),
                const Positioned(
                  left: 150,
                  bottom: 0,
                  child: Material(
                    color: Colors.deepOrange,
                    shape: CircleBorder(),
                    elevation: 5,
                    child: Icon(Icons.doorbell),
                    // IconButton(
                    //   icon: Icon(Icons.doorbell),
                    //   onPressed: () {},
                    // ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            '12 hr 15 min',
            style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const Text(
            'This schedule does not meet your sleep goal',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          stops: [0.45, 0.5],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFF272727), Color(0xFF212121)]),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          // offset: Offset(2.0, 2.0), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF212121)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.bus_alert, color: Colors.grey),
                      SizedBox(height: 10),
                      Text('Bedtime', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 20)),
                      SizedBox(height: 5),
                      Text('1:00 AM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                      SizedBox(height: 5),
                      Text('Tomorrow', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          stops: [0.45, 0.5],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFF272727), Color(0xFF212121)]),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          // offset: Offset(2.0, 2.0), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF212121)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.doorbell_outlined, color: Colors.grey),
                      SizedBox(height: 10),
                      Text('Wake up', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 20)),
                      SizedBox(height: 5),
                      Text('8:15 AM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                      SizedBox(height: 5),
                      Text('Tomorrow', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    stops: [0.45, 0.5], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF272727), Color(0xFF212121)]),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    // offset: Offset(2.0, 2.0), //(x,y)
                    blurRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF212121)),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Edit sleep schedule in health',
                  style: TextStyle(color: Colors.orange),
                )),
          )
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final double radius;
  final double value;

  ClockPainter(this.radius, this.value);
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);
    Paint outerPaint = Paint()
      ..color = const Color(0xFF212121)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;
    Paint innerPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20
      ..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.orange, Colors.orangeAccent])
          .createShader(rect);

    canvas.drawArc(rect, 0, 8, false, outerPaint);
    canvas.drawArc(rect, -1.5, 3, false, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
