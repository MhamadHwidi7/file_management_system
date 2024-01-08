class GetAllUserInGroupParams {
  final int groupId;

  GetAllUserInGroupParams(this.groupId);

  Map<String, dynamic> toJson() => {"group_id": groupId};
}
