import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'model/definition_model.dart';
import 'model/meaning_model.dart';
import 'model/phonetic_model.dart';
import 'model/word_model.dart';
import 'navigation/app_router.dart';
import 'provider/connectivity_provider.dart';
import 'provider/notification_provider.dart';
import 'provider/word_model_provider.dart';
import 'util/methods.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  AwesomeNotifications().initialize(
      '',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            channelShowBadge: true,
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
            importance: NotificationImportance.Max)
      ],
      channelGroups: [NotificationChannelGroup(channelGroupkey: 'basic_channel_group', channelGroupName: 'Basic group')],
      debug: true);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingHandler);
  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    print('$token');
  });

  await Hive.initFlutter();
  Hive.registerAdapter(WordModelAdapter());
  Hive.registerAdapter(PhoneticAdapter());
  Hive.registerAdapter(MeaningAdapter());
  Hive.registerAdapter(DefinitionAdapter());
  await Hive.openBox('wordModels');
  await Hive.openBox('initModel');

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WordModelProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        )
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
