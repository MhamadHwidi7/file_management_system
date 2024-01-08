import 'package:json_annotation/json_annotation.dart';

part 'get_my_files_entity.g.dart';

@JsonSerializable()
class GetMyFilesEntity {
  @JsonKey(name: "Data")
  List<GetMyFilesData> getMyFilesData;
  GetMyFilesEntity(
    this.getMyFilesData,
  );
  factory GetMyFilesEntity.fromJson(Map<String, dynamic> json) =>
      _$GetMyFilesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyFilesEntityToJson(this);
}

@JsonSerializable()
class GetMyFilesData {
  @JsonKey(name: "id")
  final int fileId;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "path")
  final String filePath;

  GetMyFilesData(this.fileId, this.userId, this.filePath);
  factory GetMyFilesData.fromJson(Map<String, dynamic> json) =>
      _$GetMyFilesDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyFilesDataToJson(this);
}
