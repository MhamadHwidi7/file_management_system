// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_group_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyGroupEntity _$GetMyGroupEntityFromJson(Map<String, dynamic> json) =>
    GetMyGroupEntity(
      json['group_id'] as int,
      json['user_id'] as int,
      GroupData.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMyGroupEntityToJson(GetMyGroupEntity instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'group': instance.group,
    };

GroupData _$GroupDataFromJson(Map<String, dynamic> json) => GroupData(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$GroupDataToJson(GroupData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.groupName,
    };
