class UserRequest {
  UserRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});
  String name;
  String email;
  String password;
  String passwordConfirmation;

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
