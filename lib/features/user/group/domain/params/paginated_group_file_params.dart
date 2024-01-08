// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaginatedGroupFileParams {
  final int groupId;
  final int page;
  PaginatedGroupFileParams({
    required this.groupId,
    required this.page,
  });

  Map<String, dynamic> toJson() => {"group_id": groupId, "page": page};
}
