class ChangeFileNumParams {
  final int number;

  ChangeFileNumParams(this.number);
  Map<String, dynamic> toJson() => {"number": number};
}
