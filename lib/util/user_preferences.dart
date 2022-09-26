import 'package:hive/hive.dart';
import 'package:practice_1/model/word_model.dart';

import '../constants/app_constants.dart';

class UserPreferences {
  static UserPreferences instance = UserPreferences._init();

  Box? _initBox;
  Box? _wordModelBox;
  UserPreferences._init() {
    _initBox ??= Hive.box('initModel');
    _wordModelBox ??= Hive.box('wordModels');
  }
  Future<void> skipToWelcome() async {
    await _initBox?.put(kOnboardSkipStorageKey, true);
  }

  bool? getSkip() {
    return _initBox?.get(kOnboardSkipStorageKey);
  }

  Future<void> putWord(String text, WordModel word) async {
    await _wordModelBox?.put(text, word);
  }

  WordModel? getWord(String text) {
    return _wordModelBox?.get(text);
  }

  List<WordModel> bList = [];
  List<String> get keyList => List.from(_wordModelBox!.keys);
  List<WordModel> favoritedList() {
    List.from(_wordModelBox!.values).where((element) => element.isFavorite == true).forEach((element) => bList.add(element));
    return bList;
  }

  void clear() {
    _wordModelBox!.clear();
  }
}
