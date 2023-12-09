class FilesGroupParams {
  final int page;
  final int groupId;

  FilesGroupParams({required this.page, required this.groupId});

  Map<String, dynamic> toJson() => {"page": page, "group_id": groupId};
}
