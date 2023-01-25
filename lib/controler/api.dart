import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:magang/model/response_register.dart';
import 'package:magang/model/token.dart';
import 'package:magang/model/user_login.dart';
import 'package:magang/model/user_request.dart';

class ApiService {
  static const _baseUrl = "https://basic-book-crud-e3u54evafq-et.a.run.app/";

  static const _apiRegister = 'api/register';
  static const _apiLogin = 'api/login';
  Client client = Client();

  //create register
  Future<String> createUser(UserRequest user) async {
    var endpoint = _baseUrl + _apiRegister;
    final response =
        await client.post(Uri.parse(endpoint), body: user.toJson());
    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception("failed to fetch api");
    }
  }

  //read login
  Future<Token> getUser(UserLogin user) async {
    var endpoint = _baseUrl + _apiLogin;
    final response =
        await client.post(Uri.parse(endpoint), body: user.toJson());
    if (response.statusCode == 200) {
      return Token.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to fetch api");
    }
  }
}
