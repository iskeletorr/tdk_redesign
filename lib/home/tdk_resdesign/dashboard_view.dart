import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/provider/notification_provider.dart';
import 'package:provider/provider.dart';

import '../../navigation/app_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage? message) {
        print('before : ${context.read<NotificationProvider>().notiList}');
        context.read<NotificationProvider>().addNotiList(message);
        print('after : ${context.read<NotificationProvider>().notiList.first!
        .notification?.body}');
        print('${message?.data['view']}');
        print("Handling a background message: ${message?.messageId}");
        var temp = AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 1,
              channelKey: 'basic_channel',
              title: message?.notification?.title,
              body: message?.notification?.body,
              payload: {'click_action': 'FLUTTER_NOTIFICATION_CLICK', 'view': 'history'}),
        );

        //     // print(message?.data['view'] == 'history');
        //     // if (message?.data['view'] == 'history') {
        //     //   // Navigator.pushNamed(
        //     //   //   bcontext,
        //     //   //   '/dashboard/history',
        //     //   //   arguments: message,
        //     //   // );
        //     //   context.router.navigateNamed('/dashboard/history');
        //     // }
      },
    );
    AwesomeNotifications().actionStream.listen((receivedAction) {
      if (receivedAction.payload!.containsValue('history')) {
        // Navigator.pushNamed(
        //   bcontext,
        //   '/dashboard/history',
        //   arguments: message,
        // );
        context.router.navigateNamed('/dashboard/history');
      }

      print('actionStream---------->');
      print(receivedAction);
    });
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
