// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInEntity _$LogInEntityFromJson(Map<String, dynamic> json) => LogInEntity(
      json['msg'] as String,
      LogInData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogInEntityToJson(LogInEntity instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'Data': instance.logInData,
    };

LogInData _$LogInDataFromJson(Map<String, dynamic> json) => LogInData(
      json['id'] as int,
      json['token'] as String,
    );

Map<String, dynamic> _$LogInDataToJson(LogInData instance) => <String, dynamic>{
      'id': instance.userId,
      'token': instance.token,
    };
