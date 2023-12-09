import 'package:json_annotation/json_annotation.dart';

part 'pagination_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationEntity<T> {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: "data")
  List<T?> data;
  @JsonKey(name: "first_page_url")
  String? firstPageUrl;
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "last_page_url")
  String? lastPageUrl;
  List<Links>? links;
  @JsonKey(name: "next_page_url")
  String? nextPageUrl;
  String? path;
  @JsonKey(name: "per_page")
  dynamic perPage;
  @JsonKey(name: "prev_page_url")
  String? prevPageUrl;
  int? to;
  int? total;

  PaginationEntity(
      {this.currentPage,
      required this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});
  factory PaginationEntity.fromJson(
    dynamic json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$PaginationEntityFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginationEntityToJson(this, toJsonT);
}

@JsonSerializable()
class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});
  factory Links.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
