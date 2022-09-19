import 'package:hive/hive.dart';

import 'definition_model.dart';
part 'meaning_model.g.dart';
@HiveType(typeId: 3)
class Meaning {
  Meaning({
    this.partOfSpeech,
    this.definitions,
  });
  @HiveField(0)
  String? partOfSpeech;
  @HiveField(1)
  List<Definition>? definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions!.map((x) => x.toJson())),
      };
}
