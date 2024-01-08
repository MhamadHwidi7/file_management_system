// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'get_my_group_entity.g.dart';

@JsonSerializable()
class GetMyGroupEntity {
  @JsonKey(name: "group_id")
  final int groupId;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "group")
  GroupData group;
  GetMyGroupEntity(
    this.groupId,
    this.userId,
    this.group,
  );

  factory GetMyGroupEntity.fromJson(Map<String, dynamic> json) =>
      _$GetMyGroupEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyGroupEntityToJson(this);
}

@JsonSerializable()
class GroupData {
  final int id;
  @JsonKey(name: "name")
  final String groupName;
  GroupData(this.id, this.groupName);

  factory GroupData.fromJson(Map<String, dynamic> json) =>
      _$GroupDataFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDataToJson(this);
}
