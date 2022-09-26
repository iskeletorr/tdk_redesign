import 'package:flutter/material.dart';
import 'package:practice_1/model/word_model.dart';
import 'package:practice_1/util/user_preferences.dart';

class WordModelProvider extends ChangeNotifier {
  List<WordModel> keyWordList = List.from(UserPreferences.instance.favoritedList());
  List<String> get wordList => List.from(UserPreferences.instance.keyList);

  Future<void> setWord(String key, WordModel model) async {
    await UserPreferences.instance.putWord(key, model);
    notifyListeners();
  }

  void changeFavorite(int index) {
    /// DELETE FROM FAVORITE LIST
    print('$index -- ${keyWordList.length}');
    keyWordList[index].isFavorite = !keyWordList[index].isFavorite!;
    //  UserPreferences.instance.putWord(wordList[index], keyWordList.elementAt(index));
    setWord(keyWordList.elementAt(index).word!, keyWordList[index]);
    keyWordList.removeAt(index);
  }

  void changeFavoriteFromDesc(String text) {
    WordModel getModel = UserPreferences.instance.getWord(text)!;
    print(getModel.isFavorite);
    getModel.isFavorite = !getModel.isFavorite!;
    print(getModel.isFavorite);
    if (getModel.isFavorite!) {
      keyWordList.add(getModel);
      setWord(text, getModel);
      print(keyWordList.length);
    } else {
      keyWordList.remove(getModel);
      setWord(text, getModel);
      // notifyListeners();
    }
  }
}
