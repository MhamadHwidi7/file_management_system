// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_system_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersSystemEntity _$UsersSystemEntityFromJson(Map<String, dynamic> json) =>
    UsersSystemEntity(
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$UsersSystemEntityToJson(UsersSystemEntity instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'name': instance.userName,
      'email': instance.email,
    };
