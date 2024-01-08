class DownloadFileParams {
  final int fileId;

  DownloadFileParams({required this.fileId});
  Map<String, dynamic> toJson() => {
        "file_id": fileId,
      };
}
