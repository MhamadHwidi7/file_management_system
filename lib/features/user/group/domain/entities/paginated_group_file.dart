import 'package:json_annotation/json_annotation.dart';
part 'paginated_group_file.g.dart';

@JsonSerializable()
class PaginatedGroupFileEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "path")
  final String path;

  PaginatedGroupFileEntity(this.id, this.path);

  factory PaginatedGroupFileEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginatedGroupFileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedGroupFileEntityToJson(this);
}
