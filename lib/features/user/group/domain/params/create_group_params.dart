class CreateGroupParams {
  final String groupName;

  CreateGroupParams(this.groupName);

  Map<String, dynamic> toJson() => {"name": groupName};
}
