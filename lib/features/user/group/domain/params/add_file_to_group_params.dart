class AddFileToGroupParams {
  final int groupId;
  final int fileId;

  AddFileToGroupParams(this.groupId, this.fileId);

  Map<String, dynamic> toJson() => {"group_id": groupId, "file_id": fileId};
}
