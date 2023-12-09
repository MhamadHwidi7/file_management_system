class DeleteFileFromGroupParams {
  final int groupId;
  final int fileId;

  DeleteFileFromGroupParams(this.groupId, this.fileId);

  Map<String, dynamic> toJson() => {"file_id": fileId, "group_id": groupId};
}
