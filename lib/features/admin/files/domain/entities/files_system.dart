import 'package:json_annotation/json_annotation.dart';

part 'files_system.g.dart';

@JsonSerializable()
class PaginatedFilesSystem {
  @JsonKey(name: "id")
  final int fileId;
  @JsonKey(name: "path")
  final String filePath;
  PaginatedFilesSystem(
    this.fileId,
    this.filePath,
  );

  factory PaginatedFilesSystem.fromJson(Map<String, dynamic> json) =>
      _$PaginatedFilesSystemFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedFilesSystemToJson(this);
}

// @JsonSerializable()
// class PaginatedGroupsSystem {
//   FilesSystemEntity filesSystemEntity;

//   PaginatedGroupsSystem(
//     this.filesSystemEntity,
//   );

//   factory PaginatedGroupsSystem.fromJson(Map<String, dynamic> json) =>
//       _$PaginatedGroupsSystemFromJson(json);

//   Map<String, dynamic> toJson() => _$PaginatedGroupsSystemToJson(this);
// }
