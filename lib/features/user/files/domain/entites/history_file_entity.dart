import 'package:json_annotation/json_annotation.dart';
part 'history_file_entity.g.dart';

@JsonSerializable()
class HistoryFileEntity {
  @JsonKey(name: "operation")
  final String operationName;
  @JsonKey(name: "date")
  final String operationDate;
  @JsonKey(name: "user")
  final UserDataHistoryObject userDataHistoryObject;

  HistoryFileEntity(
      this.operationName, this.operationDate, this.userDataHistoryObject);

  factory HistoryFileEntity.fromJson(Map<String, dynamic> json) =>
      _$HistoryFileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryFileEntityToJson(this);
}

@JsonSerializable()
class UserDataHistoryObject {
  @JsonKey(name: "name")
  final String userName;
  @JsonKey(name: "email")
  final String email;

  UserDataHistoryObject(this.userName, this.email);

  factory UserDataHistoryObject.fromJson(Map<String, dynamic> json) =>
      _$UserDataHistoryObjectFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataHistoryObjectToJson(this);
}
