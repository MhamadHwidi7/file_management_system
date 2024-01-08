import 'package:json_annotation/json_annotation.dart';
part 'get_all_file_check_in_group_entity.g.dart';

@JsonSerializable()
class GetAllFileCheckInGroupEntity {
  @JsonKey(name: "Data")
  final List<FileCheckInObject>? files;

  GetAllFileCheckInGroupEntity(this.files);

  factory GetAllFileCheckInGroupEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllFileCheckInGroupEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllFileCheckInGroupEntityToJson(this);
}

@JsonSerializable()
class FileCheckInObject {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "path")
  final String path;

  FileCheckInObject(this.id, this.path);

  factory FileCheckInObject.fromJson(Map<String, dynamic> json) =>
      _$FileCheckInObjectFromJson(json);

  Map<String, dynamic> toJson() => _$FileCheckInObjectToJson(this);
}
