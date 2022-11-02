import '../model/word_model.dart';

abstract class IUserPreferences <T>{
  Future<void> put(String text, T word);

  T? get(String text);
}
