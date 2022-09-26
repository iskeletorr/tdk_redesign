import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../navigation/app_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (context.router.currentPath != '/dashboard/welcome') {
          context.router.navigate(const WelcomeRouter());
          return false;
        }
        return true;
      },
      child: AutoTabsRouter.tabBar(
        routes: const [WelcomeRouter(), SearchRouter(), FavoriteRouter(), HistoryRouter()],
        builder: (context, child, tabController) {
          return Scaffold(
            body: child,
            bottomNavigationBar: bottomNavigationBar(context),
          );
        },
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: context.tabsRouter.activeIndex,
        onTap: context.tabsRouter.setActiveIndex,
        backgroundColor: Colors.white,
        iconSize: 35,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFc91d42),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.home_outlined),
                    Divider(
                      thickness: 5,
                      color: context.tabsRouter.activeIndex == 0 ? Colors.red : Colors.transparent,
                    )
                  ],
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search),
                  Divider(
                    thickness: 5,
                    color: context.tabsRouter.activeIndex == 1 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bookmark_border),
                  Divider(
                    thickness: 5,
                    color: context.tabsRouter.activeIndex == 2 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history),
                  Divider(
                    thickness: 5,
                    color: context.tabsRouter.activeIndex == 3 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
        ]);
  }
}
