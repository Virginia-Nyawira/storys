// To parse this JSON data, do
//
//     final stories = storiesFromJson(jsonString);

import 'dart:convert';

List<Stories> storiesFromJson(String str) => List<Stories>.from(json.decode(str).map((x) => Stories.fromJson(x)));

String storiesToJson(List<Stories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stories {
  String id;
  String heading;
  String image;
  String body;
  String lessons;

  Stories({
    required this.id,
    required this.heading,
    required this.image,
    required this.body,
    required this.lessons,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    id: json["id"],
    heading: json["heading"],
    image: json["image"],
    body: json["body"],
    lessons: json["lessons"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "heading": heading,
    "image": image,
    "body": body,
    "lessons": lessons,
  };
}
