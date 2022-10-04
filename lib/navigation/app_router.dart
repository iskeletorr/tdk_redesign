import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/auth/auth_service.dart';
import 'package:practice_1/home/login_and_signup/login_screen.dart';
import 'package:practice_1/home/login_and_signup/signup_screen.dart';
import 'package:practice_1/home/login_and_signup/splash_screen.dart';
import 'package:practice_1/home/tdk_resdesign/desc_screen.dart';
import 'package:practice_1/home/tdk_resdesign/favorite_screen.dart';
import 'package:practice_1/home/tdk_resdesign/history_screen.dart';
import 'package:practice_1/home/tdk_resdesign/onboard_screen.dart';
import 'package:practice_1/home/tdk_resdesign/search_screen.dart';
import 'package:practice_1/home/tdk_resdesign/welcome_screen.dart';

import '../home/tdk_resdesign/dashboard_view.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, path: '/splash', initial: true),
    AutoRoute(page: OnboardScreen, path: '/onboard'),
    AutoRoute(page: LoginScreen, path: '/login'),
    AutoRoute(page: SignupScreen, path: '/signup'),
    
    AutoRoute(guards: [AuthGuard],page: DashboardScreen, path: '/dashboard', children: [
      AutoRoute(name: 'WelcomeRouter', page: EmptyRouterPage, path: 'welcome', children: [
        AutoRoute(page: WelcomeScreen, path: ''),
        descRoute,
      ]),
      AutoRoute(name: 'SearchRouter', page: EmptyRouterPage, path: 'search', children: [
        AutoRoute(page: SearchScreen, path: ''),
        descRoute,
      ]),
      AutoRoute(name: 'FavoriteRouter', page: EmptyRouterPage, path: 'favorite', children: [
        AutoRoute(page: FavoriteScreen, path: ''),
        descRoute,
      ]),
      historyRoute
    ])
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}

const AutoRoute descRoute = AutoRoute(page: DescScreen, path: ':text');
const AutoRoute historyRoute = AutoRoute(name: 'HistoryRouter', page: EmptyRouterPage, path: 'history', children: [
  AutoRoute(page: HistoryScreen, path: ''),
  descRoute,
]);

class AuthGuard extends AutoRouteGuard {          
 @override          
 void onNavigation(NavigationResolver resolver, StackRouter router) {                  
     if(AuthService().currentUser()){                   
        resolver.next(true);          
      }else{                   
         router.push(LoginRoute());          
         }              
     }          
}      