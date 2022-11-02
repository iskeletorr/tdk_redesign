import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'bar_chart_widget.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool isActive = false;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF272727),
      bottomNavigationBar:
          BottomNavigationBar(elevation: 0, backgroundColor: Colors.transparent, currentIndex: 0, type: BottomNavigationBarType.fixed, items: const [
        BottomNavigationBarItem(
            icon: Material(
                elevation: 5,
                shape: CircleBorder(),
                child: Icon(
                  Icons.home,
                  color: Colors.orange,
                )),
            label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.timer), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: ''),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Row(
                children: const [
                  Icon(Icons.stacked_line_chart, color: Colors.grey),
                ],
              ),
              actions: [
                Container(
                  width: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(15), color: Colors.black),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Average Sleep', style: TextStyle(fontSize: 26, color: Colors.white)),
                Text('7 hours last week', style: TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
            barChart(),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'Sleep | Wake Up',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Material(
                elevation: 5,
                shape: const CircleBorder(),
                // borderRadius: BorderRadius.circular(20),
                child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFda7347)), // 9b4d2e üst kısım,kahve
                    child: TextButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ))),
              )
            ]),
            const Divider(
              color: Color(0xFF0a0a0a),
            ),
            Material(
              elevation: 15,
              shadowColor: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(8), // padding
                decoration: BoxDecoration(color: const Color(0xFF212121), borderRadius: BorderRadius.circular(20), boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    // offset: Offset(2.0, 2.0), //(x,y)
                    blurRadius: 2.0,
                  ),
                ]),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: const Color(0xFF212121), borderRadius: BorderRadius.circular(20), boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.black,
                      offset: Offset(0.1, 0.1), //(x,y)
                      blurRadius: 2.0,
                    ),
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('8:15 AM', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Tomorrow Morning', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                      Material(
                        elevation: 5,
                        color: const Color(0xFF212121),
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(tileMode: TileMode.mirror,radius: 1,colors: [Color(0xFF212121),Color.fromARGB(3, 68, 66, 66)]),
                          //   boxShadow: [
                          //   BoxShadow(
                          //       color: Color(0xFF212121).withOpacity(0.3), // elevation
                          //       offset: Offset(-1, -1), //(x,y)
                          //       blurRadius: 1.0,
                          //       blurStyle: BlurStyle.inner),
                          //   BoxShadow(
                          //       color: Color(0xFF212121).withOpacity(0.9), // elevation
                          //       offset: Offset(-1, 1), //(x,y)
                          //       blurRadius: 1.0,
                          //       blurStyle: BlurStyle.inner),
                          //   BoxShadow(
                          //       color: Color(0xFF212121).withOpacity(0.9), // elevation
                          //       offset: Offset(1, -1), //(x,y)
                          //       blurRadius: 1.0,
                          //       blurStyle: BlurStyle.inner),
                          //   BoxShadow(
                          //       color: Colors.grey, // elevation
                          //       offset: Offset(1, 1), //(x,y)
                          //       blurRadius: 1.0,
                          //       blurStyle: BlurStyle.inner),
                          // ],
                           borderRadius: BorderRadius.circular(30), color: const Color(0xFF212121)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Change',
                                style: TextStyle(color: Colors.orange),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('other', style: TextStyle(color: Colors.white, fontSize: 20)),
            const Divider(
              color: Color(0xFF0a0a0a),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('5:20 AM', style: TextStyle(fontSize: 30, color: Colors.grey)),
                      Text('Alarm, every day', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Material(
                    color: const Color(0xFF212121),
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Switch(
                      value: isActive,
                      onChanged: (value) {
                        isActive = !isActive;
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Material(
            //       color: const Color(0xFF212121),
            //       shape: const CircleBorder(),
            //       elevation: 5,
            //       child: Container(
            //         height: 60,
            //         width: 60,
            //         child: const Icon(
            //           Icons.home,
            //           color: Colors.grey,
            //         ),
            //       ),
            //     ),
            //     Material(
            //       color: const Color(0xFF212121),
            //       shape: const CircleBorder(),
            //       elevation: 5,
            //       child: Container(
            //         height: 60,
            //         width: 60,
            //         child: const Icon(
            //           Icons.alarm,
            //           color: Colors.grey,
            //         ),
            //       ),
            //     ),
            //     Material(
            //       color: const Color(0xFF212121),
            //       shape: const CircleBorder(),
            //       elevation: 5,
            //       child: Container(
            //         height: 60,
            //         width: 60,
            //         child: const Icon(
            //           Icons.timer,
            //           color: Colors.grey,
            //         ),
            //       ),
            //     ),
            //     Material(
            //       color: const Color(0xFF212121),
            //       shape: const CircleBorder(),
            //       elevation: 5,
            //       child: Container(
            //         height: 60,
            //         width: 60,
            //         child: const Icon(
            //           Icons.person_outline_outlined,
            //           color: Colors.grey,
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
