import 'package:practice_1/model/word_model.dart';
import 'package:practice_1/util/i_user_preferences.dart';

class UserPreferencesMock implements IUserPreferences<WordModel> {
  UserPreferencesMock();
  static dynamic value;
  @override
  WordModel? get(String key) {
    return value;
  }

  @override
  Future<void> put(String text, WordModel word) async {
     value=word;
  }
}
