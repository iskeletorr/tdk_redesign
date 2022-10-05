import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../provider/notification_provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('History Screen')),
        body: Consumer<NotificationProvider>(
          builder: (context, notificationProvider, child) =>
              notificationProvider.notiList.isEmpty 
              ? emptyColumn() : filledColumn(notificationProvider),
        ));
  }

  Column emptyColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text('You didn\'t get any notifications yet.', style: TextStyle(fontSize: 22)),
        Expanded(child: SvgPicture.asset('assets/no_data.svg'))
      ],
    );
  }

  Column filledColumn(NotificationProvider notificationProvider) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: notificationProvider.notiList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${notificationProvider.notiList.elementAt(index)?.notification?.title}'),
              onTap: () {},
            );
          },
        )),
      ],
    );
  }
}
