import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../auth/auth_service.dart';
import '../../navigation/app_router.dart';
import '../../util/user_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isNotInitial() {
    var box = UserPreferences.instance.getSkip();
    bool isInitial = box == null ? false : true;
    return isInitial;
  }

  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 700));
    if (auth.currentUser()) {
      AutoRouter.of(context).replace(const DashboardRoute());
    }
    else if (isNotInitial()) {
      AutoRouter.of(context).replace(const LoginRoute());
    } else {
      AutoRouter.of(context).replace(const OnboardRoute());
    }
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF34a8eb),
      body: Center(
        child: CircularProgressIndicator(color: Colors.red),
      ),
    );
  }
}
