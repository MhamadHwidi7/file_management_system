import 'package:json_annotation/json_annotation.dart';

part 'file_state_entity.g.dart';

@JsonSerializable()
class FileStateEntity {
  @JsonKey(name: 'Data')
  final FileStateObject? fileData;

  FileStateEntity(this.fileData);
  factory FileStateEntity.fromJson(Map<String, dynamic> json) =>
      _$FileStateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FileStateEntityToJson(this);
}

@JsonSerializable()
class FileStateObject {
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "file_id")
  final int fileId;
  @JsonKey(name: "user")
  final UserObject userData;
  FileStateObject(
    this.userId,
    this.fileId,
    this.userData,
  );

  factory FileStateObject.fromJson(Map<String, dynamic> json) =>
      _$FileStateObjectFromJson(json);

  Map<String, dynamic> toJson() => _$FileStateObjectToJson(this);
}

@JsonSerializable()
class UserObject {
  @JsonKey(name: "name")
  final String name;

  UserObject(this.name);

  factory UserObject.fromJson(Map<String, dynamic> json) =>
      _$UserObjectFromJson(json);

  Map<String, dynamic> toJson() => _$UserObjectToJson(this);
}
