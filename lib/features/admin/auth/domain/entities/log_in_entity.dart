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

  AdminLogInData(this.adminId, this.token);

  factory AdminLogInData.fromJson(Map<String, dynamic> json) =>
      _$AdminLogInDataFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLogInDataToJson(this);
}
