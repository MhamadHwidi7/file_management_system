// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminLogInEntity _$AdminLogInEntityFromJson(Map<String, dynamic> json) =>
    AdminLogInEntity(
      json['msg'] as String,
      AdminLogInData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdminLogInEntityToJson(AdminLogInEntity instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'Data': instance.adminLogInData,
    };

AdminLogInData _$AdminLogInDataFromJson(Map<String, dynamic> json) =>
    AdminLogInData(
      json['id'] as int,
      json['token'] as String,
    );

Map<String, dynamic> _$AdminLogInDataToJson(AdminLogInData instance) =>
    <String, dynamic>{
      'id': instance.adminId,
      'token': instance.token,
    };
