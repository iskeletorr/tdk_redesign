import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice_1/provider/notification_provider.dart';
import 'package:provider/provider.dart';
import '../../navigation/app_router.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // List<String> notiList = UserPreferences.instance.keyList;
  @override
  Widget build(BuildContext context) {
    // List<String> notiList = context.watch<notificationProvider>().notiListNotified();

    return Scaffold(
        appBar: AppBar(title: const Text('History Screen')),
        body: Consumer<NotificationProvider>(
          builder: (context, notificationProvider, child) => notificationProvider.notiList.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text('You didn\'t get any notifications yet.', style: TextStyle(fontSize: 22)),
                    Expanded(child: SvgPicture.asset('assets/no_data.svg'))
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: notificationProvider.notiList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${notificationProvider.notiList.elementAt(index)?.notification?.title}'),
                          onTap: () {
                            // print(notificationProvider.keynotiList.elementAt(index).word);
                            print(notificationProvider.notiList);
                            context.router.navigate(DescRoute(text: '${notificationProvider.notiList.elementAt(index)?.notification?.body}'));
                          },
                        );
                      },
                    )),
                  ],
                ),
        ));
  }
}
