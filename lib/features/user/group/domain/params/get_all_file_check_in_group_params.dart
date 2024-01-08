class GetAllFileCheckInGroupParams {
  final int groupId;

  GetAllFileCheckInGroupParams(this.groupId);

  Map<String, dynamic> toJson() => {"group_id": groupId};
}
