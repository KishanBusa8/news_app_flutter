import 'dart:convert';

import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  User(
      {this.name,
        this.id,
        this.email,
      });

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;


  factory User.fromRawJson(String str) =>
      User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    id: json["id"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "email": email,
  };
}
