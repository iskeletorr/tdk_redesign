import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDetail extends StatefulWidget {
  const CalendarDetail({super.key});

  @override
  State<CalendarDetail> createState() => _CalendarDetailState();
}

class _CalendarDetailState extends State<CalendarDetail> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.white)),
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  ),
                ],
              ),
              actions: const [CircleAvatar()],
            ),
            TableCalendar(
              calendarStyle: const CalendarStyle(
                  cellMargin: EdgeInsets.all(0),
                  todayDecoration: BoxDecoration(color: Colors.deepOrange, shape: BoxShape.circle),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  // todayTextStyle: TextStyle(color: Colors.white),
                  defaultTextStyle: TextStyle(color: Colors.white, fontSize: 16)),
              headerStyle: HeaderStyle(
                leftChevronIcon: Row(children: const [
                  Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  Text(
                    'Sep',
                    style: TextStyle(color: Colors.white),
                  )
                ]),
                rightChevronIcon: Row(children: const [
                  Text(
                    'Nov',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ]),
                titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                titleCentered: true,
                formatButtonVisible: false,
                titleTextFormatter: (date, locale) {
                  // setState
                  return DateFormat.MMMM(locale).format(date);
                },
              ),
              rowHeight: 32,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
            Row(
              children: const [
                Text(
                  'Ongoing',
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Stepper(
                  steps: [
                    Step(
                      content: SizedBox.shrink(),
                      state: StepState.disabled,
                      title: Text(
                        '9.00 AM',
                        style: TextStyle(color: Colors.white),
                      ),
                      label: 
                      eventContainer('Software Testing', 'Anita and David', '11.00 AM-11.20 AM', Colors.orange.shade800),
                    ), Step(
                      title: Text(
                        '9.00 AM',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Container(
                        width: 30,
                        height: 40,
                        color: Colors.red,
                      ),
                    ), Step(
                      title: Text(
                        '9.00 AM',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Container(
                        width: 30,
                        height: 40,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Row(
            //   children: [
            //     const Text('10 AM', style: TextStyle(color: Colors.white, fontSize: 18)),
            //     const SizedBox(width: 3),
            //     Row(
            //       children: [
            //         const Icon(Icons.radio_button_on_rounded, color: Colors.orange),
            //         // SizedBox(
            //         //   height: 1,
            //         //   width: 295,
            //         //   child: Container(color: Colors.yellow),
            //         // )
            //         SizedBox(
            //             width: MediaQuery.of(context).size.width * 0.7,
            //             child: Divider(
            //               height: 5,
            //               thickness: 2,
            //               color: Colors.orange.shade800,
            //             ))
            //       ],
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     Column(
            //       children: const [
            //         Text('11 AM', style: TextStyle(color: Colors.white, fontSize: 18)),
            //         SizedBox(height: 25),
            //         Text('12 AM', style: TextStyle(color: Colors.white, fontSize: 18)),
            //       ],
            //     ),
            //     const SizedBox(width: 20),
            //     eventContainer('Software Testing', 'Anita and David', '11.00 AM-11.20 AM', Colors.orange.shade800),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Container eventContainer(String title, String names, String clock, Color color) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: color),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 24)),
            Text(names, style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [CircleAvatar(), SizedBox(width: 5), CircleAvatar(), SizedBox(width: 55)],
                ),
                Text(clock, style: const TextStyle(color: Colors.white))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
