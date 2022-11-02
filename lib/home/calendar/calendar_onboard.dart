import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'calendar_summary.dart';

class CalendarOnboard extends StatefulWidget {
  const CalendarOnboard({super.key});

  @override
  State<CalendarOnboard> createState() => _CalendarOnboardState();
}

class _CalendarOnboardState extends State<CalendarOnboard> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'assets/ss.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 28.0,
              right: 28,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: const TextSpan(
                  text: 'Manage your daily tasks',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                )),
                const SizedBox(height: 25),
                RichText(
                    text: TextSpan(
                  text: 'Team and Project management with solution providing App',
                  style: TextStyle(fontSize: 18, color: Colors.orange.shade700),
                )),
                const SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Draggable(
                    axis: Axis.horizontal,
                    feedback: Container(
                      decoration: const BoxDecoration(color: Colors.orangeAccent, shape: BoxShape.circle),
                      width: 80,
                      height: 80,
                    ),
                    childWhenDragging: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '     Get started   ',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        DragTarget(
                            builder: (context, candidateData, rejectedData) {
                              return Container( // offset,key
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              );
                            },
                          ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: Colors.orangeAccent, shape: BoxShape.circle),
                          width: 80,
                          height: 80,
                        ),
                        const Positioned(
                            left: 30,
                            top: 10,
                            child: Text(
                              'Get started',
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            )),
                        // Positioned(
                        //   left: 270,
                        //   child: DragTarget(
                        //     builder: (context, candidateData, rejectedData) {
                        //       return Container( // offset,key
                        //         height: 50,
                        //         width: 50,
                        //         color: Colors.white,
                        //       );
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                    onDragCompleted: () {
                      print("onDragCompleted");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalendarSummary(),
                          ));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
