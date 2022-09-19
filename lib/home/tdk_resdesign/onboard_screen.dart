import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:practice_1/constants/app_constants.dart';
import 'package:practice_1/model/app_router.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController pageController = PageController();
  final initBox = Hive.box('initModel');
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            color: Color(0xFFc91d42),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {
                  initBox.put(kOnboardSkipStorageKey, true);
                  AutoRouter.of(context).push(const WelcomeRoute());
                },
                child: Row(
                  children: const [
                    Text('ATLA', style: TextStyle(color: Colors.white, fontSize: 13)),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 15)
                  ],
                ),
              ),
            ]),
          ),
          Expanded(child: Image.asset('assets/messaging.png')),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  child: pageViewBuilder())),
        ]));
  }

  PageView pageViewBuilder() {
    return PageView.builder(
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              // margin: EdgeInsets.only(left:8, right:8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Color(0xFFe72c52)),
              child: Column(
                children: [
                  const SizedBox(height: 75),
                  const Text('Detaylı Kelime İnceleme', style: TextStyle(fontSize: 28, color: Colors.white)),
                  const SizedBox(height: 15),
                  const Text('Sonuç ekranında kelimenin anlamlarını', style: TextStyle(fontSize: 20, color: Colors.white70)),
                  const Text('inceleyin, telaffuzunu dinleyin, dilerseniz ', style: TextStyle(fontSize: 20, color: Colors.white70)),
                  const Text('kütüphanenize kaydedin.', style: TextStyle(fontSize: 20, color: Colors.white70)),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(radius: 5, backgroundColor: Colors.white),
                      // SizedBox(width: 8),
                      // CircleAvatar(radius: 5, backgroundColor: Colors.white),
                      // SizedBox(width: 8),
                      // CircleAvatar(
                      //   radius: 5,
                      //   backgroundColor: Colors.white,
                      //   child: CircleAvatar(radius: 4, backgroundColor: Color(0xFFe72c52)),
                      // ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: index == 0 ? Colors.transparent : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: index == 1 ? Colors.transparent : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: index == 2 ? Colors.transparent : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.ease);
                            // without animation?
                          },
                          icon: index == 2
                              ? Icon(
                                  Icons.noise_control_off,
                                  color: Colors.transparent,
                                )
                              : Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  )
                ],
              ));
        });
  }
}
