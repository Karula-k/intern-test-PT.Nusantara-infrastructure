import 'package:flutter/material.dart';
import 'package:magang/controler/api.dart';
import 'package:magang/model/token.dart';
import 'package:magang/model/user_login.dart';
import 'package:magang/provider/provider.dart';
import 'package:magang/screens/register_screen.dart';
import 'package:magang/widget/text_handle_controler.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeNamed = '/login_route';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controlerEmail = TextEditingController();

  final _controlerPassword = TextEditingController();

  @override
  void dispose() {
    _controlerEmail.dispose();
    _controlerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextHandleControler(
                controller: _controlerEmail, hint: "Your Email"),
            TextHandleControler(
                controller: _controlerPassword, hint: "Your Password"),
            ElevatedButton(
                onPressed: () async {
                  UserLogin user = UserLogin(
                      email: _controlerEmail.text,
                      password: _controlerPassword.text);
                  _controlerEmail.clear();
                  _controlerPassword.clear();
                  if (user.email != "" && user.password != "") {
                    Token result = await Provider.of<ApiUserProvider>(context,
                            listen: false)
                        .login(user);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              title: const Text(""),
                              content: Text(result.message),
                              actions: [
                                TextButton(
                                    child: const Text("Ok"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ]),
                        );
                      },
                    );
                  }
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed(RegisterScreen.routeNamed);
                  });
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
