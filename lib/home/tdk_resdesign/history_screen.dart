import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice_1/provider/word_model_provider.dart';
import 'package:provider/provider.dart';
import '../../navigation/app_router.dart';
import '../../util/user_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // List<String> wordList = UserPreferences.instance.keyList;
  @override
  Widget build(BuildContext context) {
    // List<String> wordList = context.watch<WordModelProvider>().wordListNotified();

    return Consumer<WordModelProvider>(
        builder: (context, wordModelProvider, child) => Scaffold(
              appBar: AppBar(title: const Text('History Screen')),
              body: wordModelProvider.wordList.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text('You didn\'t search any words yet.', style: TextStyle(fontSize: 22)),
                        Expanded(child: SvgPicture.asset('assets/no_data.svg'))
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                          itemCount: wordModelProvider.wordList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(wordModelProvider.wordList.elementAt(index)),
                              onTap: () {
                                // print(wordModelProvider.keyWordList.elementAt(index).word);
                                print(wordModelProvider.wordList);
                                context.router.navigate(DescRoute(text: wordModelProvider.wordList.elementAt(index)));
                              },
                            );
                          },
                        )),
                      ],
                    ),
            ));
  }
}
