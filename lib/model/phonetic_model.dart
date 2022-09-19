import 'package:hive/hive.dart';

part 'phonetic_model.g.dart';
@HiveType(typeId: 1)
class Phonetic {
  Phonetic({
    this.text,
    this.audio,
  });
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"],
        audio: json["audio"] == null ? null : json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio == null ? null : audio,
      };
}