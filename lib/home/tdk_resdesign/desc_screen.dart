import 'package:flutter/material.dart';
import 'package:practice_1/model/word_model.dart';
import 'package:practice_1/util/pronunciation.dart';
import 'package:provider/provider.dart';

import '../../provider/word_model_provider.dart';
import '../../network/network_manager.dart';
import '../../util/user_preferences.dart';

class DescScreen extends StatefulWidget {
  const DescScreen({super.key, this.text});
  final String? text;
  @override
  State<DescScreen> createState() => _DescScreenState();
}

class _DescScreenState extends State<DescScreen> {
  late WordModel? box;
  Future<WordModel?>? lateWordModel;
  int pageIndex = 0;

  Future<WordModel> getWordModel() async {
    WordModel model = await NetworkManager.getWord(widget.text);
    await context.read<WordModelProvider>().setWord(widget.text!, model);
    return Future.value(model);
  }

  @override
  void initState() {
    super.initState();
    box = UserPreferences.instance.getWord(widget.text.toString());
    if (box == null) {
      lateWordModel = getWordModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<WordModelProvider>(
            builder: (context, wordModelProvider, child) => box == null
                ? FutureBuilder<WordModel?>(
                    future: lateWordModel,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text('data is not cached'));
                      }
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return defaultTabController(snapshot.data);
                    })
                : defaultTabController(box)));
  }

  DefaultTabController defaultTabController(WordModel? box) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          AppBar(
              backgroundColor: const Color(0xFFc91d42),
              elevation: 0,
              leading: Column(
                children: const [
                  Icon(Icons.menu),
                ],
              ),
              centerTitle: true,
              title: appBarTitle(box)),
          Container(
            color: const Color(0xFFc91d42),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconButtons(Icons.font_download_outlined, const Color(0xFFd8c4b8), 'font'),
                    iconButtons(Icons.copy_rounded, const Color(0xFFd8c4b8), 'kopyala'),
                    iconButtons(Icons.bookmark_border, const Color(0xFFd8c4b8), 'kaydet'),
                    iconButtons(Icons.sign_language_outlined, const Color(0xFFd8c4b8), 'i??aret dili'),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: Colors.white),
                  child:
                      const TabBar(indicatorWeight: 4, indicatorColor: Colors.red, unselectedLabelColor: Colors.grey, labelColor: Colors.red, tabs: [
                    Tab(child: Text('Anlam', style: TextStyle(fontSize: 15))),
                    Tab(child: Text('Deyim', style: TextStyle(fontSize: 15))),
                    Tab(child: Text('Birle??ik Kelime', style: TextStyle(fontSize: 15)))
                  ]),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  color: Colors.white,
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: box!.meanings!.map((e) => bodyColumn(box, box.meanings!.indexOf(e))).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Center(child: Text('2. view')),
                    const Center(child: Text('3. view'))
                  ])))
        ],
      ),
    );
  }

  Row appBarTitle(WordModel? box) {
    return Row(children: [
              const SizedBox(width: 30),
              IconButton(
                  onPressed: () => Pronunciation.instance.playSound('${box!.phonetics![0].audio}'),
                  icon: const Icon(Icons.volume_up_outlined, size: 40)),
              const SizedBox(width: 10),
              Text('${box?.word}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
              const SizedBox(width: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Provider.of<WordModelProvider>(context, listen: false).changeFavoriteFromDesc(widget.text!);
                      },
                      icon: Icon(
                        Icons.bookmark_border,
                        color: box!.isFavorite! ? Colors.black : Colors.white,
                      )),
                ],
              )
            ]);
  }

  Column bodyColumn(WordModel? box, int index) {
    List? synonym = box?.meanings![index].definitions!.first.synonyms;
    String? example = box?.meanings![index].definitions!.first.example;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        meaning(index, box),
        if ((example != null)) meaningExample(example),
        if ((synonym?.isNotEmpty != false)) meaningSynonym(synonym),
        const SizedBox(height: 30),
      ],
    );
  }

  Row meaning(int index, WordModel? box) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${index + 1}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(width: 7),
        Flexible(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(text: box?.meanings![index].partOfSpeech, style: const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold)),
            const TextSpan(text: "   "),
            TextSpan(
              text: '${box?.meanings![index].definitions!.first.definition}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
            )
          ])),
        ),
      ],
    );
  }

  Column meaningExample(String example) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          example,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  Column meaningSynonym(List<dynamic>? synonym) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          '${synonym!.first}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  InkWell iconButtons(IconData? iconData, Color? color, String text) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 64,
        width: 64,
        margin: const EdgeInsets.all(8.0),
        child: Material(
          // elevation: 5.0,
          color: Colors.pinkAccent,
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
