import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../navigation/app_router.dart';
import '../../provider/word_model_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Favorite Screen')),
        body: Consumer<WordModelProvider>(
          builder: (context, wordModelProvider, child) => wordModelProvider.keyWordList.isEmpty 
          ? emptyColumn() : filledColumn(wordModelProvider),
        ));
  }

  Column emptyColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text('You dont\'t have any favorite words yet.', style: TextStyle(fontSize: 22)),
        Expanded(child: SvgPicture.asset('assets/like_dislike.svg'))
      ],
    );
  }

  Column filledColumn(WordModelProvider wordModelProvider) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: wordModelProvider.keyWordList.length,
          itemBuilder: (context, index) {
            return wordListTile(wordModelProvider, index, context);
          },
        )),
      ],
    );
  }

  ListTile wordListTile(WordModelProvider wordModelProvider, int index, BuildContext context) {
    return ListTile(
      title: Text(wordModelProvider.keyWordList.elementAt(index).word!),
      trailing: IconButton(
          onPressed: () {
            Provider.of<WordModelProvider>(context, listen: false).changeFavorite(index);
          },
          icon: Icon(
            Icons.bookmark_border,
            color: wordModelProvider.keyWordList.elementAt(index).isFavorite! ? Colors.red : Colors.black,
          )),
      onTap: () {
        context.router.navigate(DescRoute(text: wordModelProvider.keyWordList.elementAt(index).word!));
      },
    );
  }
}
