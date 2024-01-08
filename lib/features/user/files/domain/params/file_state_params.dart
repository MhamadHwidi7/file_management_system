class FileStateParams {
  final int fileId;

  FileStateParams(this.fileId);

  Map<String, dynamic> toJson() => {"file_id": fileId};
}
