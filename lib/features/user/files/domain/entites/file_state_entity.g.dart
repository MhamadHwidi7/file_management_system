// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileStateEntity _$FileStateEntityFromJson(Map<String, dynamic> json) =>
    FileStateEntity(
      json['Data'] == null
          ? null
          : FileStateObject.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileStateEntityToJson(FileStateEntity instance) =>
    <String, dynamic>{
      'Data': instance.fileData,
    };

FileStateObject _$FileStateObjectFromJson(Map<String, dynamic> json) =>
    FileStateObject(
      json['user_id'] as int,
      json['file_id'] as int,
      UserObject.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileStateObjectToJson(FileStateObject instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'file_id': instance.fileId,
      'user': instance.userData,
    };

UserObject _$UserObjectFromJson(Map<String, dynamic> json) => UserObject(
      json['name'] as String,
    );

Map<String, dynamic> _$UserObjectToJson(UserObject instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
