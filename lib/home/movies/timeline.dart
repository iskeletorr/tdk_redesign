import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  TextTheme get appTextTheme => appTheme.textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get topPadding => mediaQuery.padding.top;
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
  double dynamicHeight(double ratio) => mediaQuery.size.height * ratio;
  double dynamicWidth(double ratio) => mediaQuery.size.width * ratio;
}

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<DataObject> data = [
    DataObject("7 PM", true, false),
    DataObject(
      "8 PM",
      false,
      true,
    ),
    DataObject("9 PM", true, true),
    DataObject("10 PM", true, true),
    DataObject("11 PM", false, true),
    DataObject("12 PM", false, false),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            // gradient: RadialGradient(
            //     // begin: Alignment.topLeft,
            //     // end: Alignment.bottomRight,
            //     center: Alignment.topLeft,
            //     radius: 1.5,
            //     colors: [Color(0xFF3c2821), Color(0xFF0d0d0d)],
            //     stops: [0.05, 0.35]),
            ),
        child: Column(
          children: [
            const Spacer(flex: 6),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: List.generate(
                          data.length,
                          (index) => Container(
                            height: context.dynamicHeight(0.1),
                            width: context.dynamicWidth(0.1),
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            child: Text(data[index].data, textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 9,
                      child: Column(
                        children: List.generate(
                          data.length,
                          (index) => Container(
                            height: data[index].hasData
                                ? (data[index].hasNeighbor ? context.dynamicHeight(0.1) : context.dynamicHeight(0.125))
                                : context.dynamicHeight(0.075),
                            width: context.dynamicWidth(0.85),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              top: data[index].hasNeighbor
                                  ? 0
                                  : data[index].hasData
                                      ? 0
                                      : context.dynamicHeight(0.1),
                              // bottom: data[index].hasNeighbor && data[index].hasData ? context.dynamicHeight(0.05) : 0
                            ),
                            child: !data[index].hasData
                                ? (data[index].now
                                    ? Row(
                                        children: [
                                          Radio(
                                            value: true,
                                            groupValue: "groupValue",
                                            onChanged: (_) {},
                                            activeColor: Colors.orangeAccent,
                                            fillColor: MaterialStateProperty.all(Colors.red),
                                          ),
                                          const Expanded(child: Divider(thickness: 4)),
                                        ],
                                      )
                                    : const SizedBox.shrink())
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      color: data[index].hasData ? Colors.red : Colors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Flexible(
                                                  child: Text("Mobile App Design", style: TextStyle(fontWeight: FontWeight.bold)),
                                                ),
                                                Flexible(child: Text("Mike and Anita")),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataObject {
  final String data;
  final bool hasData;
  final bool hasNeighbor;
  final bool now;

  DataObject(this.data, this.hasData, this.hasNeighbor, {this.now = false});
}



// RadialGradient(
//             colors: [
//               Color(0xFF9d5f47),
//               Color(0xFFa85531),
//               Color(0xFF9a4d30),
//               Color(0xFF9e4e2d),
//               Color(0xFFa75330),
//               Color(0xFFd5825c),
//             ],
//             stops: [
//               0.1,
//               0.2,
//               0.4,
//               0.65,
//               0.75,
//               0.91
//             ],
//           ),
