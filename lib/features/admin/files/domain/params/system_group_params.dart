class SystemGroupsParams {
  final int page;

  SystemGroupsParams({
    required this.page,
  });

  Map<String, dynamic> toJson() => {
        "page": page,
      };
}
