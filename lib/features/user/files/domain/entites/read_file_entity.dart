import 'package:json_annotation/json_annotation.dart';
part 'read_file_entity.g.dart';

@JsonSerializable()
class ReadFileEntity {
  @JsonKey(name: "Data")
  final String fileData;
  ReadFileEntity({
    required this.fileData,
  });

  factory ReadFileEntity.fromJson(Map<String, dynamic> json) =>
      _$ReadFileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReadFileEntityToJson(this);
}
