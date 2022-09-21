import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../model/word_model.dart';

class NetworkManager {
  NetworkManager();

  static Future<WordModel> getWord(String? text) async {
    final response = await http.get(Uri.parse('$url$text'));
    final jsonData = jsonDecode(response.body);
    final wordModel = jsonData.map((e) => WordModel.fromJson(e)).toList();
    List<WordModel> word = List.from(wordModel);
    return word.first;
  }
}
