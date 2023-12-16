import 'package:flutter/material.dart';
import 'package:myapp/views/login.dart';
import 'package:myapp/views/signup.dart';

class AuthPage extends StatefulWidget {
   AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreen);
    } else {
      return SignUpPage(showLoginPage: toggleScreen);
    }
  }

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
}
