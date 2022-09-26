import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_1/model/definition_model.dart';
import 'package:practice_1/model/meaning_model.dart';
import 'package:practice_1/model/phonetic_model.dart';
import 'package:practice_1/provider/word_model_provider.dart';
import 'package:provider/provider.dart';
import 'navigation/app_router.dart';
import 'model/word_model.dart';

Future<void> main() async {
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
    return ChangeNotifierProvider(
      create: (context) => WordModelProvider(),
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
