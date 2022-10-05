import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_service.dart';
import '../../model/word_model.dart';
import '../../navigation/app_router.dart';
import '../../provider/word_model_provider.dart';
import '../../util/user_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> wordList = UserPreferences.instance.keyList;
  String? randomWord;
  WordModel? randomWordModel;
  AuthService auth = AuthService();
  Future? latevar;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Consumer<WordModelProvider>(builder: (context, wordModelProvider, child) {
        return DefaultTabController(
          length: 2,
          child: Container(
            color: const Color(0xFFc91d42),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: Colors.white),
                    child: searchRow(),
                  ),
                ),
                const TabBar(indicatorColor: Colors.transparent, tabs: [
                  Tab(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Günün Kelimesi', style: TextStyle(fontSize: 16)),
                  )),
                  Tab(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Tümü', style: TextStyle(fontSize: 16)),
                  ))
                ]),
                Expanded(
                  child: TabBarView(
                    children: [SingleChildScrollView(child: firstTabView()), const Center(child: Text('second tab view'))],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Column firstTabView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buttonsContainer(),
        SizedBox(
          child: Stack(
            children: [
              Container(color: Colors.white, height: 30),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: const Color(0xFFf8f1e9)),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      color: const Color(0xFFf8f1e9)),
                  height: 30),
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0, color: Colors.white),
            ),
            child: commonRow('Son Aramalar')),
        // if (wordList.isEmpty) Expanded(child: Container(height: 10, decoration: const BoxDecoration(color: Colors.white))),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: wordList.length <= 1 ? MediaQuery.of(context).size.width : null,
            height: MediaQuery.of(context).size.height * 0.17,
            color: Colors.white,
            child: Row(
              children: wordList.length >= 3
                  ? wordList.sublist(wordList.length - 3).map((e) => wordContainer(wordList.indexOf(e))).toList()
                  : wordList.map((e) => wordContainer(wordList.indexOf(e))).toList(),
            ),
          ),
        ),
        Container(height: 10, color: Colors.white)
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFc91d42),
      leading: Column(
        children: const [
          Icon(Icons.menu),
        ],
      ),
      title: const Text('Hoşgeldiniz', style: TextStyle(fontSize: 35, color: Colors.white)),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Column(
            children: const [
              Text("11.027 kelime içinden arama yapın.", style: TextStyle(fontSize: 16, color: Colors.white70)),
            ],
          )),
    );
  }

  Row searchRow() {
    return Row(
      children: [
        const SizedBox(width: 8),
        const Icon(Icons.search, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: Autocomplete<String>(
            optionsBuilder: (textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return UserPreferences.instance.keyList.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              AutoRouter.of(context).push(DescRoute(text: selection));
              debugPrint('You just selected $selection');
            },
            fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(hintText: 'Bir kelime yazın..', hintStyle: TextStyle(color: Colors.grey), border: InputBorder.none),
                focusNode: focusNode,
                onEditingComplete: () {
                  wordList.add(textEditingController.text);
                  AutoRouter.of(context).push(DescRoute(text: textEditingController.text));
                },
              );
            },
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none, color: Color(0xFFc91d42)),
            padding: EdgeInsets.zero,
            alignment: AlignmentDirectional.center),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.content_copy_rounded, color: Color(0xFFc91d42)),
            padding: EdgeInsets.zero,
            alignment: AlignmentDirectional.centerStart),
      ],
    );
  }

  Widget wordContainer(int index) {
    var keyWord = UserPreferences.instance.getWord(wordList[index]);
    // if (keyWord == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xFFf3f3f2)),
        child: Row(
          children: [
            Column(
              children: [
                Text('${keyWord?.word}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                const Text('[s] çok büyük, kocaman', style: TextStyle(fontSize: 14, color: Color(0xFF8a8686))),
              ],
            ),
            const SizedBox(width: 100),
            IconButton(
                onPressed: () {
                  keyWord.isFavorite == true
                      ? context.read<WordModelProvider>().changeFavorite(
                        context.read<WordModelProvider>().keyWordList.indexOf(keyWord)
                        )
                      : context.read<WordModelProvider>().addFavorite(keyWord);
                },
                icon: Icon(
                  Icons.bookmark_border,
                  color: keyWord!.isFavorite! ? Colors.red : Colors.black,
                )),
          ],
        ),
      ),
    );
  }

  Padding commonRow(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).navigate(const SearchRouter());
              },
              child: const Text('Tümü', style: TextStyle(color: Colors.grey)))
        ],
      ),
    );
  }

  Container buttonsContainer() {
    if (wordList.isNotEmpty && randomWord == null) {
      randomWord = wordList.elementAt(Random().nextInt(wordList.length));
      randomWordModel = UserPreferences.instance.getWord(randomWord!);
    }

    return Container(
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Color(0xFFf8f1e9)),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Text(
            '16.02.2020',
            style: TextStyle(color: Color.fromARGB(255, 31, 28, 27)),
          ),
          Text('${randomWordModel?.word}', style: const TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconButtons(Icons.copy_rounded, const Color(0xFFd8c4b8), 'kopyala'),
              iconButtons(Icons.volume_up, const Color(0xFFd8c4b8), 'dinle'),
              iconButtons(Icons.bookmark_border, const Color(0xFFd8c4b8), 'kaydet'),
              iconButtons(Icons.share, const Color(0xFFd8c4b8), 'paylaş'),
            ],
          )
        ],
      ),
    );
  }

  InkWell iconButtons(IconData? iconData, Color? color, String text) {
    return InkWell(
      child: Container(
        height: 64,
        width: 64,
        margin: const EdgeInsets.all(8.0),
        child: Material(
          // elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(iconData, color: color), const SizedBox(height: 7), Text(text, style: TextStyle(color: color))],
          ),
        ),
      ),
    );
  }
}
