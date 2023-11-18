// To parse this JSON data, do
//
//     final skillsModel = skillsModelFromJson(jsonString);

import 'dart:convert';

List<SkillsModel> skillsModelFromJson(String str) => List<SkillsModel>.from(json.decode(str).map((x) => SkillsModel.fromJson(x)));

String skillsModelToJson(List<SkillsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SkillsModel {
  int? id;
  String? name;
  String? location;
  List<String>? skills;

  SkillsModel({
    this.id,
    this.name,
    this.location,
    this.skills,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
    id: json["id"],
    name: json["name"],
    location: json["location"],
    skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "location": location,
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
  };
}
