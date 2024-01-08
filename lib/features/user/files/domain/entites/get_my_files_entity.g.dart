// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_files_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyFilesEntity _$GetMyFilesEntityFromJson(Map<String, dynamic> json) =>
    GetMyFilesEntity(
      (json['Data'] as List<dynamic>)
          .map((e) => GetMyFilesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMyFilesEntityToJson(GetMyFilesEntity instance) =>
    <String, dynamic>{
      'Data': instance.getMyFilesData,
    };

GetMyFilesData _$GetMyFilesDataFromJson(Map<String, dynamic> json) =>
    GetMyFilesData(
      json['id'] as int,
      json['user_id'] as int,
      json['path'] as String,
    );

Map<String, dynamic> _$GetMyFilesDataToJson(GetMyFilesData instance) =>
    <String, dynamic>{
      'id': instance.fileId,
      'user_id': instance.userId,
      'path': instance.filePath,
    };
