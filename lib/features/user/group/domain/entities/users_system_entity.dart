import 'package:json_annotation/json_annotation.dart';

part 'users_system_entity.g.dart';

@JsonSerializable()
class UsersSystemEntity {
  @JsonKey(name: "id")
  final int userId;
  @JsonKey(name: "name")
  final String userName;
  @JsonKey(name: "email")
  final String email;

  UsersSystemEntity(this.userId, this.userName, this.email);

  factory UsersSystemEntity.fromJson(Map<String, dynamic> json) =>
      _$UsersSystemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UsersSystemEntityToJson(this);
}
