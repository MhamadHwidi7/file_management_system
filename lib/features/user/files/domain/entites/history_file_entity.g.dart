// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_file_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryFileEntity _$HistoryFileEntityFromJson(Map<String, dynamic> json) =>
    HistoryFileEntity(
      json['operation'] as String,
      json['date'] as String,
      UserDataHistoryObject.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryFileEntityToJson(HistoryFileEntity instance) =>
    <String, dynamic>{
      'operation': instance.operationName,
      'date': instance.operationDate,
      'user': instance.userDataHistoryObject,
    };

UserDataHistoryObject _$UserDataHistoryObjectFromJson(
        Map<String, dynamic> json) =>
    UserDataHistoryObject(
      json['name'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$UserDataHistoryObjectToJson(
        UserDataHistoryObject instance) =>
    <String, dynamic>{
      'name': instance.userName,
      'email': instance.email,
    };
