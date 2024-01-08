class CheckOutFileParams {
  final int fileId;

  CheckOutFileParams(this.fileId);

  Map<String, dynamic> toJson() => {"file_id": fileId};
}
