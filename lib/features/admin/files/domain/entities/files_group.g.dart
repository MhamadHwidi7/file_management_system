// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedFilesGroup _$PaginatedFilesGroupFromJson(Map<String, dynamic> json) =>
    PaginatedFilesGroup(
      json['id'] as int?,
      json['path'] as String?,
    );

Map<String, dynamic> _$PaginatedFilesGroupToJson(
        PaginatedFilesGroup instance) =>
    <String, dynamic>{
      'id': instance.fileId,
      'path': instance.filePath,
    };
