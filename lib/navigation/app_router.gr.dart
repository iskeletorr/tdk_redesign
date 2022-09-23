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
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DashboardScreen());
    },
    WelcomeRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    FavoriteRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    HistoryRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
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
    },
    SearchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchScreen());
    },
    FavoriteRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const FavoriteScreen());
    },
    HistoryRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryRouteArgs>(
          orElse: () => const HistoryRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: HistoryScreen(key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: '/splash'),
        RouteConfig(OnboardRoute.name, path: '/onboard'),
        RouteConfig(DashboardRoute.name, path: '/dashboard', children: [
          RouteConfig(WelcomeRouter.name,
              path: 'welcome',
              parent: DashboardRoute.name,
              children: [
                RouteConfig(WelcomeRoute.name,
                    path: '', parent: WelcomeRouter.name),
                RouteConfig(DescRoute.name,
                    path: ':text', parent: WelcomeRouter.name)
              ]),
          RouteConfig(SearchRouter.name,
              path: 'search',
              parent: DashboardRoute.name,
              children: [
                RouteConfig(SearchRoute.name,
                    path: '', parent: SearchRouter.name),
                RouteConfig(DescRoute.name,
                    path: ':text', parent: SearchRouter.name)
              ]),
          RouteConfig(FavoriteRouter.name,
              path: 'favorite',
              parent: DashboardRoute.name,
              children: [
                RouteConfig(FavoriteRoute.name,
                    path: '', parent: FavoriteRouter.name),
                RouteConfig(DescRoute.name,
                    path: ':text', parent: FavoriteRouter.name)
              ]),
          RouteConfig(HistoryRouter.name,
              path: 'history',
              parent: DashboardRoute.name,
              children: [
                RouteConfig(HistoryRoute.name,
                    path: '', parent: HistoryRouter.name),
                RouteConfig(DescRoute.name,
                    path: ':text', parent: HistoryRouter.name)
              ])
        ])
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
  const OnboardRoute() : super(OnboardRoute.name, path: '/onboard');

  static const String name = 'OnboardRoute';
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [EmptyRouterPage]
class WelcomeRouter extends PageRouteInfo<void> {
  const WelcomeRouter({List<PageRouteInfo>? children})
      : super(WelcomeRouter.name, path: 'welcome', initialChildren: children);

  static const String name = 'WelcomeRouter';
}

/// generated route for
/// [EmptyRouterPage]
class SearchRouter extends PageRouteInfo<void> {
  const SearchRouter({List<PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [EmptyRouterPage]
class FavoriteRouter extends PageRouteInfo<void> {
  const FavoriteRouter({List<PageRouteInfo>? children})
      : super(FavoriteRouter.name, path: 'favorite', initialChildren: children);

  static const String name = 'FavoriteRouter';
}

/// generated route for
/// [EmptyRouterPage]
class HistoryRouter extends PageRouteInfo<void> {
  const HistoryRouter({List<PageRouteInfo>? children})
      : super(HistoryRouter.name, path: 'history', initialChildren: children);

  static const String name = 'HistoryRouter';
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [DescScreen]
class DescRoute extends PageRouteInfo<DescRouteArgs> {
  DescRoute({Key? key, String? text})
      : super(DescRoute.name,
            path: ':text', args: DescRouteArgs(key: key, text: text));

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

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute() : super(FavoriteRoute.name, path: '');

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({Key? key})
      : super(HistoryRoute.name, path: '', args: HistoryRouteArgs(key: key));

  static const String name = 'HistoryRoute';
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key}';
  }
}
