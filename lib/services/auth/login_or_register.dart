import 'package:chatapps/pages/login.dart';
import 'package:chatapps/pages/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show the login screen
  bool showLoginPage = true;
//toggle between login and register page
  void toggle1pages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(onTap: toggle1pages);
    } else {
      return Register(onTap: toggle1pages);
    }
  }
}
