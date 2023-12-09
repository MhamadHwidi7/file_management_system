import 'package:json_annotation/json_annotation.dart';

part 'log_in_entity.g.dart';

@JsonSerializable()
class LogInEntity {
  @JsonKey(name: 'msg')
  final String message;
  @JsonKey(name: "Data")
  final LogInData logInData;

  LogInEntity(this.message, this.logInData);

  factory LogInEntity.fromJson(Map<String, dynamic> json) =>
      _$LogInEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LogInEntityToJson(this);
}

@JsonSerializable()
class LogInData {
  @JsonKey(name: 'id')
  final int userId;
  @JsonKey(name: 'token')
  final String token;

  LogInData(this.userId, this.token);

  factory LogInData.fromJson(Map<String, dynamic> json) =>
      _$LogInDataFromJson(json);

  Map<String, dynamic> toJson() => _$LogInDataToJson(this);
}
