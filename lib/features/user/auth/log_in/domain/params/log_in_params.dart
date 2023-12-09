class LogInParams {
  final String email;
  final String password;

  LogInParams(this.email, this.password);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
