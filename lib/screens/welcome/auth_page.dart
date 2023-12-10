import 'package:chat/screens/welcome/login_page.dart';
import 'package:chat/screens/welcome/registr_page.dart';
import 'package:flutter/material.dart';

class authPage extends StatefulWidget {
  const authPage({Key? key}) : super(key: key);

  @override
  State<authPage> createState() => _authPageState();
}

//initially , show login page

class _authPageState extends State<authPage> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreen);
    } else {
      return RegisterPage(
        showLoginPage: toggleScreen,
      );
    }
  }
}
