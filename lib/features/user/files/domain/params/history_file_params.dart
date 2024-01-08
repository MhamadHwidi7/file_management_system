// ignore_for_file: public_member_api_docs, sort_constructors_first
class HistoryFileParams {
  final int fileId;
  final int page;
  HistoryFileParams({
    required this.fileId,
    required this.page,
  });

  Map<String, dynamic> toJson() => {"file_id": fileId, "page": page};
}
