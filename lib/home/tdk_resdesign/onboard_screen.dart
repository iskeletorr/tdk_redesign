import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/util/user_preferences.dart';
import '../../navigation/app_router.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            color: const Color(0xFFc91d42),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {
                  UserPreferences.instance.skipToWelcome().then((value) => AutoRouter.of(context).replace(const DashboardRoute()));
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
                  decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  child: pageViewBuilder())),
        ]));
  }

  PageView pageViewBuilder() {
    return PageView.builder(
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
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
                            if (index == 2) {
                              UserPreferences.instance.skipToWelcome().then((value) => AutoRouter.of(context).replace(const DashboardRoute()));
                              // initBox.put(kOnboardSkipStorageKey, true);
                              // AutoRouter.of(context).replace(const DashboardRouter());
                            }
                            pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  )
                ],
              ));
        });
  }
}
