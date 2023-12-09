class DeleteFileParams {
  final int fileId;
  final String token;

  DeleteFileParams(this.fileId, this.token);

  Map<String, dynamic> toJson() => {"file_id": fileId, "token": token};
}
