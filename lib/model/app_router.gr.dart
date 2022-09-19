// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreen());
    },
    OnboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OnboardScreen());
    },
    WelcomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WelcomeScreen());
    },
    DescRoute.name: (routeData) {
      final args =
          routeData.argsAs<DescRouteArgs>(orElse: () => const DescRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DescScreen(key: args.key, text: args.text));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: '/splash'),
        RouteConfig(OnboardRoute.name, path: '/onboard-screen'),
        RouteConfig(WelcomeRoute.name, path: '/welcome'),
        RouteConfig(DescRoute.name, path: '/desc')
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [OnboardScreen]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute() : super(OnboardRoute.name, path: '/onboard-screen');

  static const String name = 'OnboardRoute';
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [DescScreen]
class DescRoute extends PageRouteInfo<DescRouteArgs> {
  DescRoute({Key? key, String? text})
      : super(DescRoute.name,
            path: '/desc', args: DescRouteArgs(key: key, text: text));

  static const String name = 'DescRoute';
}

class DescRouteArgs {
  const DescRouteArgs({this.key, this.text});

  final Key? key;

  final String? text;

  @override
  String toString() {
    return 'DescRouteArgs{key: $key, text: $text}';
  }
}
