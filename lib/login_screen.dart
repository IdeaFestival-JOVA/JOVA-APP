import 'package:flutter/material.dart';
import 'package:jovajovajova/service/auth_service.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInAndNavigate(context);
          },
          child: Text('Login with OAuth'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tokens = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Text('Access Token: ${tokens['accessToken']}'),
      ),
    );
  }
}
