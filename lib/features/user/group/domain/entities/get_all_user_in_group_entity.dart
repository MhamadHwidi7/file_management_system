// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'get_all_user_in_group_entity.g.dart';

@JsonSerializable()
class GetAllUsersInGroupEntity {
  @JsonKey(name: "Data")
  List<UserDataObject> user;
  GetAllUsersInGroupEntity({
    required this.user,
  });

  factory GetAllUsersInGroupEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersInGroupEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllUsersInGroupEntityToJson(this);
}

@JsonSerializable()
class UserDataObject {
  final int id;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "user")
  final UserMap userMap;
  UserDataObject(this.id, this.userId, this.userMap);

  factory UserDataObject.fromJson(Map<String, dynamic> json) =>
      _$UserDataObjectFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataObjectToJson(this);
}

@JsonSerializable()
class UserMap {
  @JsonKey(name: "name")
  final String userName;

  UserMap(this.userName);

  factory UserMap.fromJson(Map<String, dynamic> json) =>
      _$UserMapFromJson(json);

  Map<String, dynamic> toJson() => _$UserMapToJson(this);
}
