class DeleteFileParams {
  final int fileId;

  DeleteFileParams(this.fileId);

  Map<String, dynamic> toJson() => {"file_id": fileId};
}
