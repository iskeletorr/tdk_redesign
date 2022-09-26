import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/util/user_preferences.dart';
import '../../navigation/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  bool isNotInitial() {
    var box = UserPreferences.instance.getSkip();
    bool isInitial = box == null ? false : true;
    return isInitial;
  }

  void initialization() {
    // await Future.delayed(const Duration(milliseconds: 700));

    if (isNotInitial()) {
      AutoRouter.of(context).replace(const DashboardRoute());
    } else {
      AutoRouter.of(context).replace(const OnboardRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF34a8eb),
      body: Center(
        child: Image.asset('assets/turkey.png', width: 200, height: 200),
      ),
    );
  }
}
