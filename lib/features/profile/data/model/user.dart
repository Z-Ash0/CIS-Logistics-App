import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String message;
  final UserData data;
  User({required this.message, required this.data});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  final String avatar;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;

  UserData({required this.avatar, required this.name, required this.email});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
