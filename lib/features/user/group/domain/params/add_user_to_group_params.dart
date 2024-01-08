class AddUserToGroupParams {
  final int userId;
  final int groupId;

  AddUserToGroupParams(this.userId, this.groupId);

  Map<String, dynamic> toJson() => {"user_id": userId, "group_id": groupId};
}
