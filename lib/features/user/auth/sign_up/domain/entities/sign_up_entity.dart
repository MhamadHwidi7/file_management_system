import 'package:json_annotation/json_annotation.dart';

part 'sign_up_entity.g.dart';

@JsonSerializable()
class SignUpEntity {
  @JsonKey(name: 'msg')
  final String message;

  SignUpEntity(this.message);

  factory SignUpEntity.fromJson(Map<String, dynamic> json) =>
      _$SignUpEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpEntityToJson(this);
}
