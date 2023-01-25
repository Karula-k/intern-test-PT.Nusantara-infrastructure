import 'package:flutter/material.dart';
import 'package:magang/controler/api.dart';
import 'package:magang/provider/provider.dart';
import 'package:magang/screens/login_screen.dart';
import 'package:magang/screens/register_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiUserProvider>(
            create: (_) => ApiUserProvider(apiService: ApiService()))
      ],
      builder: (context, child) => MaterialApp(
        initialRoute: LoginScreen.routeNamed,
        routes: {
          LoginScreen.routeNamed: (context) => const LoginScreen(),
          RegisterScreen.routeNamed: (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
