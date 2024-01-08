// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_in_group_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersInGroupEntity _$GetAllUsersInGroupEntityFromJson(
        Map<String, dynamic> json) =>
    GetAllUsersInGroupEntity(
      user: (json['Data'] as List<dynamic>)
          .map((e) => UserDataObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUsersInGroupEntityToJson(
        GetAllUsersInGroupEntity instance) =>
    <String, dynamic>{
      'Data': instance.user,
    };

UserDataObject _$UserDataObjectFromJson(Map<String, dynamic> json) =>
    UserDataObject(
      json['id'] as int,
      json['user_id'] as int,
      UserMap.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataObjectToJson(UserDataObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user': instance.userMap,
    };

UserMap _$UserMapFromJson(Map<String, dynamic> json) => UserMap(
      json['name'] as String,
    );

Map<String, dynamic> _$UserMapToJson(UserMap instance) => <String, dynamic>{
      'name': instance.userName,
    };
