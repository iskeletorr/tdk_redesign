import 'dart:convert';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_1/model/word_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DescScreen extends StatefulWidget {
  const DescScreen({super.key, this.text});
  final String? text;
  @override
  State<DescScreen> createState() => _DescScreenState();
}

class _DescScreenState extends State<DescScreen> {
  String url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
  late WordModel? box;
  final wordModelBox = Hive.box('wordModels');
  late final AudioPlayer audioPlayer;
  late final List<WordModel> word;
  late final Future<List<WordModel>> lateWordModel;
  int pageIndex = 0;

  Future<List<WordModel>> getWord() async {
    final response = await http.get(Uri.parse('$url${widget.text}'));
    final jsonData = jsonDecode(response.body);
    // word = jsonData[0]['word'][0];
    final wordModel = jsonData.map((e) => WordModel.fromJson(e)).toList();
    word = List.from(wordModel);
    // if(!wordModelBox.containsKey(widget.text))
    await wordModelBox.put(widget.text, word.first);
    
    // print(box);
    setState(() {});
    return word;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lateWordModel = getWord();
    box = wordModelBox.get(widget.text);
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            padding: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: bottomNavigationBar()),
        body: FutureBuilder<List<WordModel>>(
            future: lateWordModel,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return defaultTabController();
              }
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }
              return defaultTabController();
            }));
  }

  DefaultTabController defaultTabController() {
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
              title: Row(children: [
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: ()  {
WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                        String audioString = '${word.first.phonetics![0].audio}';
                      await audioPlayer.setUrl(audioString);
                      await audioPlayer.play();
});
                    },
                    icon: const Icon(
                      Icons.volume_up_outlined,
                      size: 40,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text('${box?.word}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500))
              ])),
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
                    iconButtons(Icons.sign_language_outlined, const Color(0xFFd8c4b8), 'işaret dili'),
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
                    Tab(child: Text('Birleşik Kelime', style: TextStyle(fontSize: 15)))
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
                              children: [
                                const SizedBox(width: 15),
                                bodyColumn(),
                                const SizedBox(height: 50),
                                bodyColumn(),
                                const SizedBox(height: 50),
                              ],
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

  Column bodyColumn() {
    List? synonym = box?.meanings![0].definitions!.first.synonyms;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // index by parameter ??
            const Text('0', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(width: 7),
            Flexible(
              child: RichText(
                  text: TextSpan(children: [
                    // word.first.meanings![0].partOfSpeech
                TextSpan(text: box?.meanings![0].partOfSpeech, style: const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold)),
                const TextSpan(text: "   "),
                TextSpan(
                  text: '${box?.meanings![0].definitions!.first.definition}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                )
              ])),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          '${box?.meanings![0].definitions!.first.example}', 
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        if((synonym?.isNotEmpty != false)) 
        Column(
          children: [
            const SizedBox(height: 20),
            Text(
              '${synonym!.first}', 
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        backgroundColor: Colors.white,
        iconSize: 35,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFc91d42),
        selectedLabelStyle: const TextStyle(fontSize: 20),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.home_outlined),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 0 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 1 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bookmark_border),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 2 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 3 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
        ]);
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
          child: Container(
            // padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(iconData, color: color), const SizedBox(height: 7), Text(text, style: TextStyle(color: color))],
            ),
          ),
        ),
      ),
    );
  }
}
