import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(name: 'message')
  String? message;

  ErrorModel(this.message);

  factory ErrorModel.fromJson(dynamic json) {
    if (json is String) {
      return ErrorModel(json);
    } else if (json is Map<String, dynamic>) {
      return _$ErrorModelFromJson(json);
    } else {
      throw FormatException('Unexpected response format');
    }
  }

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
