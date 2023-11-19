// To parse this JSON data, do
//
//     final skillsModel = skillsModelFromJson(jsonString);

import 'dart:convert';

SkillsModel skillsModelFromJson(String str) => SkillsModel.fromJson(json.decode(str));

String skillsModelToJson(SkillsModel data) => json.encode(data.toJson());

class SkillsModel {
  List<MoreSkill>? users;

  SkillsModel({
    this.users,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
    users: json["users"] == null ? [] : List<MoreSkill>.from(json["users"]!.map((x) => MoreSkill.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class MoreSkill {
  int? id;
  String? name;
  String? location;
  List<String>? skills;

  MoreSkill({
    this.id,
    this.name,
    this.location,
    this.skills,
  });

  factory MoreSkill.fromJson(Map<String, dynamic> json) => MoreSkill(
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
