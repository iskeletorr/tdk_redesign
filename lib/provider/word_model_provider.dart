import 'package:flutter/material.dart';
import 'package:practice_1/auth/auth_service.dart';
import 'package:practice_1/model/word_model.dart';
import 'package:practice_1/util/user_preferences.dart';

class WordModelProvider extends ChangeNotifier {
  BuildContext context;
  WordModelProvider(this.context);
  List<WordModel> keyWordList = List.from(UserPreferences.instance.favoritedList);
  List<String> get wordList => List.from(UserPreferences.instance.keyList);

  Future<void> setWord(String key, WordModel model) async {
    await UserPreferences.instance.putWord(key, model);
    notifyListeners();
  }

  void changeFavorite(int index) {
    keyWordList[index].isFavorite = !keyWordList[index].isFavorite!;
    setWord(keyWordList.elementAt(index).word!, keyWordList[index]);
    keyWordList.removeAt(index);
  }

  void changeFavoriteFromDesc(String text) {
    WordModel getModel = UserPreferences.instance.getWord(text)!;
    getModel.isFavorite = !getModel.isFavorite!;
    if (getModel.isFavorite!) {
      keyWordList.add(getModel);
      setWord(text, getModel);
    } else {
      keyWordList.remove(getModel);
      setWord(text, getModel);
    }
  }

  bool checkUser() {
    bool a = AuthService().currentUser();
    notifyListeners();
    return a;
  }
}
