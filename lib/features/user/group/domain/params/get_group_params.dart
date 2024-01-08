class GetGroupParams {
  final int page;

  GetGroupParams({required this.page});
  Map<String, dynamic> toJson() => {"page": page};
}
