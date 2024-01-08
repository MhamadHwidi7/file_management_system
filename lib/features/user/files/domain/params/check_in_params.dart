class CheckInFileParams {
  final List<int> fileId;
  final int groupId;

  CheckInFileParams(this.fileId, this.groupId);

  Map<String, dynamic> toJson() => {"group_id": groupId, "file_ids": fileId};
}
