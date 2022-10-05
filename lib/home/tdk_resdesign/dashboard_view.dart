import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/app_router.dart';
import '../../provider/notification_provider.dart';
import '../../util/connectivity_x.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    NetworkAwareState(context).initStateSubs();
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        context.router.navigateNamed('/dashboard/history');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage? message) {
        context.read<NotificationProvider>().addNotiList(message);
        if (message?.data.containsValue('history') == true) {
          context.router.navigateNamed('/dashboard/history');
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage? message) {
        context.read<NotificationProvider>().addNotiList(message);
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'basic_channel',
            title: message?.notification?.title,
            body: message?.notification?.body,
            payload: {'click_action': 'FLUTTER_NOTIFICATION_CLICK', 'view': 'history'},
          ),
        );
      },
    );
    AwesomeNotifications().actionStream.listen((receivedAction) {
      if (receivedAction.payload?.containsValue('history') == true) {
        context.router.navigateNamed('/dashboard/history');
      }
    });
  }

  @override
  void dispose() {
    NetworkAwareState(context).disposeSubs();
    super.dispose();
  }

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
          navBarItem(context, 0, const Icon(Icons.home_outlined)),
          navBarItem(context, 1, const Icon(Icons.search)),
          navBarItem(context, 2, const Icon(Icons.bookmark_border)),
          navBarItem(context, 3, const Icon(Icons.history)),
        ]);
  }

  BottomNavigationBarItem navBarItem(BuildContext context, int index, Icon icon) {
    return BottomNavigationBarItem(
        icon: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Divider(
                thickness: 5,
                color: context.tabsRouter.activeIndex == index ? Colors.red : Colors.transparent,
              )
            ],
          ),
        ),
        label: '');
  }
}
