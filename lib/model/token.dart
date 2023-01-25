class Token {
  Token({required this.message, required this.token});
  String message;
  String token;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}
