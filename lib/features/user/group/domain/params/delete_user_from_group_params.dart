class DeleteUserFromGroupParams {
  final int userId;
  final int groupId;

  DeleteUserFromGroupParams(this.userId, this.groupId);

  Map<String, dynamic> toJson() => {"user_id": userId, "group_id": groupId};
}
