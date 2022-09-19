import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_1/model/definition_model.dart';
import 'package:practice_1/model/meaning_model.dart';
import 'package:practice_1/model/phonetic_model.dart';
import 'home/login_and_signup/forgot_screen.dart';
import 'home/login_and_signup/login_screen.dart';
import 'home/tdk_resdesign/desc_screen.dart';
import 'home/tdk_resdesign/onboard_screen.dart';
import 'home/tdk_resdesign/welcome_screen.dart';
import 'model/app_router.dart';
import 'home/login_and_signup/signup_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'model/word_model.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // routes: {
      //   // '/': (context) => const LoginScreen(),
      //   // '/signup': (context) => const SignupScreen(),
      //   // '/forgot': (context) => const ForgotScreen(),
      //   '/': (context) => const OnboardScreen(),
      //   '/desc': (context) => const DescScreen(),
      //   '/welcome' :(context) => const WelcomeScreen(),
      // },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
