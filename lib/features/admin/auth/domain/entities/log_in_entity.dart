// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'log_in_entity.g.dart';

@JsonSerializable()
class AdminLogInEntity {
  @JsonKey(name: 'msg')
  final String message;
  @JsonKey(name: "Data")
  final AdminLogInData adminLogInData;

  AdminLogInEntity(this.message, this.adminLogInData);

  factory AdminLogInEntity.fromJson(Map<String, dynamic> json) =>
      _$AdminLogInEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLogInEntityToJson(this);
}

@JsonSerializable()
class AdminLogInData {
  @JsonKey(name: 'id')
  final int adminId;
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  AdminLogInData(
    this.adminId,
    this.token,
    this.name,
    this.email,
  );

  factory AdminLogInData.fromJson(Map<String, dynamic> json) =>
      _$AdminLogInDataFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLogInDataToJson(this);
}
