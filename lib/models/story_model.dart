import 'dart:convert';

List<Story> storyFromJson(String str) =>
    List<Story>.from(json.decode(str).map((x) => Story.fromJson(x)));

String storyToJson(List<Story> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Story {
  String id;
  Level level;
  String titleId;
  String questionId;
  String solutionId;
  String titleEn;
  String questionEn;
  String solutionEn;
  String color;

  Story({
    required this.id,
    required this.level,
    required this.titleId,
    required this.questionId,
    required this.solutionId,
    required this.titleEn,
    required this.questionEn,
    required this.solutionEn,
    required this.color,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        level: levelValues.map[json["level"]]!,
        titleId: json["titleID"],
        questionId: json["questionID"],
        solutionId: json["solutionID"],
        titleEn: json["titleEN"],
        questionEn: json["questionEN"],
        solutionEn: json["solutionEN"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": levelValues.reverse[level],
        "titleID": titleId,
        "questionID": questionId,
        "solutionID": solutionId,
        "titleEN": titleEn,
        "questionEN": questionEn,
        "solutionEN": solutionEn,
        "color": color,
      };
}

enum Level { easy, hard, medium }

final levelValues = EnumValues(
    {"easy": Level.easy, "hard": Level.hard, "medium": Level.medium});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
