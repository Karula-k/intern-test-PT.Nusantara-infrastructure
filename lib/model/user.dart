class User {
  User(
      {required this.id,
      required this.name,
      required this.emailVerifiedAt,
      required this.createdAt,
      required this.updatedAt});
  String id;
  String name;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      emailVerifiedAt: json["email_verified_at"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updatedAt": updatedAt,
      };
}
