// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedSystemGroup _$PaginatedSystemGroupFromJson(
        Map<String, dynamic> json) =>
    PaginatedSystemGroup(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$PaginatedSystemGroupToJson(
        PaginatedSystemGroup instance) =>
    <String, dynamic>{
      'id': instance.groupId,
      'name': instance.groupName,
    };
