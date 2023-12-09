import 'package:json_annotation/json_annotation.dart';

part 'base_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: false)
class BaseEntity<T> {
  BaseEntity({
    required this.data,
  });

  factory BaseEntity.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$BaseEntityFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseEntityToJson(this, toJsonT);
  @JsonKey(name: "Data")
  T data;
}
