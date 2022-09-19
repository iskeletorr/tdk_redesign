import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';

import '../../constants/app_constants.dart';
import '../../model/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  bool isInitial() {
    final initBox = Hive.box('initModel');
    var box = initBox.get(kOnboardSkipStorageKey);
    bool isInitial = box == null ? false : true;
    return isInitial;
  }

  void initialization() async {
    // print('ready in 1...');
    // await Future.delayed(const Duration(seconds: 1));
    if (isInitial()) {
      AutoRouter.of(context).replaceNamed('/welcome');
    } else {
     AutoRouter.of(context).replace(const OnboardRoute());
    }
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF34a8eb),
      body: Column(
        children: [
          SizedBox(child: Image.asset('assets/turkey.png',width: 100,height: 100,)),
        ],
      ),
    );
  }
}
