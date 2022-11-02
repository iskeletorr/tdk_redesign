import 'package:hive/hive.dart';
import 'package:practice_1/util/i_user_preferences.dart';

import '../constants/app_constants.dart';
import '../model/word_model.dart';

class UserPreferences implements IUserPreferences<WordModel> {
  static UserPreferences instance = UserPreferences._init();

  Box? _initBox;
  Box? _wordModelBox;
  UserPreferences._init() {
    _initBox ??= Hive.box('initModel');
    _wordModelBox ??= Hive.box('wordModels');
  }
  Future<void> skipToWelcome() async {
    await _initBox?.get(kOnboardSkipStorageKey);
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

  List<String> get keyList => List.from(_wordModelBox!.keys);
  List<WordModel> get favoritedList => List.from(_wordModelBox!.values)
      .where(
        (element) => element.isFavorite == true,
      )
      .cast<WordModel>()
      .toList();

  void clear() {
    _wordModelBox!.clear();
  }

  @override
  WordModel? get(String key) {
    return _initBox?.get(key);
  }

  @override
  Future<void> put(String text, WordModel word) async {
    return _initBox?.put(text, word);
  }
}
