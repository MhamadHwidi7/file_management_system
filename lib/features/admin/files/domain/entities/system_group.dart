import 'package:json_annotation/json_annotation.dart';

part 'system_group.g.dart';

@JsonSerializable()
class PaginatedSystemGroup {
  @JsonKey(name: "id")
  final int? groupId;
  @JsonKey(name: "name")
  final String? groupName;
  PaginatedSystemGroup(
    this.groupId,
    this.groupName,
  );

  factory PaginatedSystemGroup.fromJson(Map<String, dynamic> json) =>
      _$PaginatedSystemGroupFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedSystemGroupToJson(this);
}
