class DeleteGroupParams {
  final int groupId;

  DeleteGroupParams(this.groupId);

  Map<String, dynamic> toJson() => {"group_id": groupId};
}
