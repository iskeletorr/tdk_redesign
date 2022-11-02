import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_1/home/alarm/alarm_detail.dart';
import 'package:practice_1/home/alarm/alarm_page.dart';
import 'package:practice_1/home/alarm_clock/alarm_view.dart';
import 'package:practice_1/home/calendar/calendar_onboard.dart';
import 'package:practice_1/home/calendar/calendar_summary.dart';
import 'package:practice_1/home/dialog/dialog_page.dart';
import 'package:practice_1/home/movies/movies_detail.dart';
import 'package:practice_1/home/movies/movies_onboard.dart';
import 'package:practice_1/home/movies/movies_search.dart';
import 'package:practice_1/home/movies/timeline.dart';
import 'package:practice_1/home/onboard/onboard.dart';
import 'package:practice_1/home/progress/progress.dart';
import 'package:practice_1/home/timer/timer.dart';
import 'package:practice_1/movie_store/movie_detail_page.dart';
import 'package:practice_1/movie_store/movie_home_page.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home/calendar/calendar_detail.dart';
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
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            primarySwatch: Colors.blue,
          ),
          home: child,
        );
      },
      child: MovieDetailPage(),
    );
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => WordModelProvider(context),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => ConnectivityProvider(),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => NotificationProvider(),
    //     )
    //   ],
    //   child: MaterialApp.router(
    //     routerDelegate: _appRouter.delegate(),
    //     routeInformationParser: _appRouter.defaultRouteParser(),
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //   ),
    // );
  }
}
