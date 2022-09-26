import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice_1/provider/word_model_provider.dart';
import 'package:practice_1/util/user_preferences.dart';
import 'package:provider/provider.dart';
import '../../navigation/app_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // List<String> wordList = UserPreferences.instance.keyList;
  TextEditingController searchController = TextEditingController();
  List<String> wordList2 = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<WordModelProvider>(
            builder: (context, wordModelProvider, child) => Scaffold(
                  appBar: AppBar(title: const Text('Search in history')),
                  body: context.read<WordModelProvider>().wordList.isEmpty
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
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                    hintText: 'Type here to search in history'),
                                controller: searchController,
                                onChanged: (value) {
                                  wordList2 = UserPreferences.instance.keyList.where((String option) {
                                    return option.contains(searchController.text.toLowerCase());
                                  }).toList();
                                  setState(() {});
                                  // context.read<WordModelProvider>().searchedWords(value);
                                },
                              ),
                            ),
                            searchController.text.isEmpty
                                ? dynamicListView(wordModelProvider.wordList)
                                : dynamicListView(wordList2),
                          ],
                        ),
                ));
  }

  Expanded dynamicListView(List<String> dynamicList) {
    return Expanded(
        child: ListView.builder(
      itemCount: dynamicList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(dynamicList.elementAt(index)),
          onTap: () {
            // context.router.navigate(SearchRouter(children: [DescRoute(text: dynamicList.elementAt(index))]));
            AutoRouter.of(context).navigate(DescRoute(text: dynamicList.elementAt(index)));
          },
        );
      },
    ));
  }
}
