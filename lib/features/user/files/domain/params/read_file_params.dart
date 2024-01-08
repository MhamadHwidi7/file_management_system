class ReadFileParams {
  final int fileId;
  ReadFileParams({
    required this.fileId,
  });

  Map<String, dynamic> toJson() => {"file_id": fileId};
}
