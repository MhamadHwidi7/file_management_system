class FilesParams {
  final int page;

  FilesParams({required this.page});

  Map<String, dynamic> toJson() => {"page": page};
}
