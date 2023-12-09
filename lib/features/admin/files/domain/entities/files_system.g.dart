// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedFilesSystem _$PaginatedFilesSystemFromJson(
        Map<String, dynamic> json) =>
    PaginatedFilesSystem(
      json['id'] as int,
      json['path'] as String,
    );

Map<String, dynamic> _$PaginatedFilesSystemToJson(
        PaginatedFilesSystem instance) =>
    <String, dynamic>{
      'id': instance.fileId,
      'path': instance.filePath,
    };
