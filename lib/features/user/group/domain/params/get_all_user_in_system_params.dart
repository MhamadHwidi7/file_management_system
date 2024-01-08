class GetAllUserInSystemParams {
  final int page;

  GetAllUserInSystemParams({required this.page});

  Map<String, dynamic> toJson() => {"page": page};
}
