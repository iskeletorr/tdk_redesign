import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:practice_1/home/calendar/calendar_detail.dart';

class CalendarSummary extends StatefulWidget {
  const CalendarSummary({super.key});

  @override
  State<CalendarSummary> createState() => _CalendarSummaryState();
}

class _CalendarSummaryState extends State<CalendarSummary> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.orange,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_rounded),
              label: '',
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.black,
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.menu),
                ],
              ),
              actions: [
                Column(
                  children: const [CircleAvatar()],
                )
              ],
            ),
            // const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hi Ghulam',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    '6 Tasks are pending',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Container(
              decoration: const BoxDecoration(
                  gradient: RadialGradient(radius: 1, center: Alignment.centerRight, colors: [Color.fromARGB(255, 82, 48, 28), Color(0xFF1a1b1c)]),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.orange),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mobile App Design',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const Text(
                      'Mike and Anita',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [CircleAvatar(), SizedBox(width: 5), CircleAvatar()],
                        ),
                        const Text(
                          'Now',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Monthly Review',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange.shade700),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CalendarDetail(),
                                ));
                          },
                          icon: const Icon(Icons.calendar_month)))
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      customContainer(140, 140, '22', 'Done'),
                      SizedBox(height: 15),
                      customContainer(140, 100, '10', 'Ongoing'),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      customContainer(140, 100, '7', 'In progress'),
                      SizedBox(height: 15),
                      customContainer(140, 140, '12', 'Waiting for Review'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container customContainer(double width, double height, String number, String text) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            RadialGradient(stops: [0.2, 0.8], radius: 0.6, center: Alignment.topCenter, colors: [Colors.orange.shade900, const Color(0xFF1a1b1c)]),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      width: width,
      height: height,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number, style: const TextStyle(fontSize: 30, color: Colors.white)),
          const SizedBox(height: 15),
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      )),
    );
  }
}
