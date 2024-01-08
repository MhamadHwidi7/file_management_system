// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_file_check_in_group_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllFileCheckInGroupEntity _$GetAllFileCheckInGroupEntityFromJson(
        Map<String, dynamic> json) =>
    GetAllFileCheckInGroupEntity(
      (json['Data'] as List<dynamic>?)
          ?.map((e) => FileCheckInObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllFileCheckInGroupEntityToJson(
        GetAllFileCheckInGroupEntity instance) =>
    <String, dynamic>{
      'Data': instance.files,
    };

FileCheckInObject _$FileCheckInObjectFromJson(Map<String, dynamic> json) =>
    FileCheckInObject(
      json['id'] as int,
      json['path'] as String,
    );

Map<String, dynamic> _$FileCheckInObjectToJson(FileCheckInObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };
