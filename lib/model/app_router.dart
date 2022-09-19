import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/home/login_and_signup/splash_screen.dart';
import 'package:practice_1/home/tdk_resdesign/desc_screen.dart';
import 'package:practice_1/home/tdk_resdesign/onboard_screen.dart';
import 'package:practice_1/home/tdk_resdesign/welcome_screen.dart';
part 'app_router.gr.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, path: '/splash', initial: true),
    AutoRoute(page: OnboardScreen, path: '/onboard'), 
    AutoRoute(page: WelcomeScreen, path: '/welcome'), 
    AutoRoute(page: DescScreen, path: '/desc'),
    
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
