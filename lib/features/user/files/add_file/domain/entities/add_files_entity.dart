import 'package:json_annotation/json_annotation.dart';

part 'add_files_entity.g.dart';

@JsonSerializable()
class AddFilesEntity {
  @JsonKey(name: 'msg')
  final String message;

  AddFilesEntity(this.message);

  factory AddFilesEntity.fromJson(Map<String, dynamic> json) =>
      _$AddFilesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddFilesEntityToJson(this);
}
