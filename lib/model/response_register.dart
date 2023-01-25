import 'package:magang/model/user.dart';

class ResponseRegister {
  ResponseRegister({required this.massage, required this.user});
  String massage;
  User user;

  factory ResponseRegister.fromJson(Map<String, dynamic> json) =>
      ResponseRegister(
        massage: json["massage"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "massage": massage,
        "user": user.toJson(),
      };
}
