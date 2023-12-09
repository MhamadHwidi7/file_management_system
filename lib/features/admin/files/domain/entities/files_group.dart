import 'package:json_annotation/json_annotation.dart';

part 'files_group.g.dart';

@JsonSerializable()
class PaginatedFilesGroup {
  ///todo:add file to group and make this class based on data response
  @JsonKey(name: "id")
  final int? fileId;
  @JsonKey(name: "path")
  final String? filePath;
  PaginatedFilesGroup(
    this.fileId,
    this.filePath,
  );

  factory PaginatedFilesGroup.fromJson(Map<String, dynamic> json) =>
      _$PaginatedFilesGroupFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedFilesGroupToJson(this);
}
