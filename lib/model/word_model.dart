// To parse this JSON data, do
//
//     final wordModel = wordModelFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';
import 'meaning_model.dart';
import 'phonetic_model.dart';
part 'word_model.g.dart';

List<WordModel> wordModelFromJson(String str) => List<WordModel>.from(json.decode(str).map((x) => WordModel.fromJson(x)));

String wordModelToJson(List<WordModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class WordModel {
  WordModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.origin,
    this.meanings,
  });
  @HiveField(0)
  String? word;
  @HiveField(1)
  String? phonetic;
  @HiveField(2)
  List<Phonetic>? phonetics;
  @HiveField(3)
  String? origin;
  @HiveField(4)
  List<Meaning>? meanings;

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        word: json["word"],
        phonetic: json["phonetic"],
        phonetics: List<Phonetic>.from(json["phonetics"].map((x) => Phonetic.fromJson(x))),
        origin: json["origin"],
        meanings: List<Meaning>.from(json["meanings"].map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": List<dynamic>.from(phonetics!.map((x) => x.toJson())),
        "origin": origin,
        "meanings": List<dynamic>.from(meanings!.map((x) => x.toJson())),
      };
}
