import 'package:flutter/material.dart';
import 'package:magang/model/response_register.dart';
import 'package:magang/model/user_request.dart';
import 'package:magang/provider/provider.dart';
import 'package:magang/widget/text_handle_controler.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeNamed = '/register_route';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _controlerName = TextEditingController();
  final _controlerEmail = TextEditingController();
  final _controlerPassword = TextEditingController();
  final _controlerRePassword = TextEditingController();

  @override
  void dispose() {
    _controlerName.dispose();
    _controlerEmail.dispose();
    _controlerPassword.dispose();
    _controlerRePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextHandleControler(controller: _controlerName, hint: "Nama"),
            TextHandleControler(controller: _controlerEmail, hint: "Email"),
            TextHandleControler(
                controller: _controlerPassword, hint: "Password"),
            TextHandleControler(
                controller: _controlerRePassword, hint: "Retype your Password"),
            ElevatedButton(
                onPressed: () async {
                  UserRequest user = UserRequest(
                      email: _controlerEmail.text,
                      password: _controlerPassword.text,
                      name: _controlerName.text,
                      passwordConfirmation: _controlerRePassword.text);
                  _controlerEmail.clear();
                  _controlerPassword.clear();
                  _controlerName.clear();
                  _controlerRePassword.clear();
                  if (user.email != "" && user.password != "") {
                    var result = await Provider.of<ApiUserProvider>(context,
                            listen: false)
                        .register(user);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                title: const Text(""),
                                content: Text(result),
                                actions: [
                                  TextButton(
                                      child: const Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ]),
                          );
                        });
                  }
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
