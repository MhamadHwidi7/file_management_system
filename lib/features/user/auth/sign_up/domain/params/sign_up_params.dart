class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams(this.name, this.email, this.password);

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
