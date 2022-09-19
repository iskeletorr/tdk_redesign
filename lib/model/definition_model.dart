import 'package:hive/hive.dart';
part 'definition_model.g.dart';
@HiveType(typeId: 2)
class Definition {
  Definition({
    this.definition,
    this.example,
    this.synonyms,
    this.antonyms,
  });
  @HiveField(0)
  String? definition;
  @HiveField(1)
  String? example;
  @HiveField(2)
  List<dynamic>? synonyms;
  @HiveField(3)
  List<dynamic>? antonyms;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        example: json["example"],
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
        "synonyms": List<dynamic>.from(synonyms!.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms!.map((x) => x)),
      };
}