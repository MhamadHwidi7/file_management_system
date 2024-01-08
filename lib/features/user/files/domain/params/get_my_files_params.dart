class GetMyFilesParams {
  final String token;

  GetMyFilesParams(this.token);

  Map<String, dynamic> toJson() => {"token": token};
}
