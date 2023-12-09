class AdminLogInParams {
  final String email;
  final String password;

  AdminLogInParams(this.email, this.password);

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
