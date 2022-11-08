import 'package:flutter/material.dart';
import 'package:intern_task/screens/createaccount_screen.dart';
import 'package:intern_task/screens/login_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially shows loginscreen
  bool showLoginScreen = true;

  void toggleScreeen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(showCreateAccountPage: toggleScreeen);
    } else {
      return CreateAccountScreen(showLoginScreen: toggleScreeen);
    }
  }
}
