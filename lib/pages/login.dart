import 'package:chatapps/components/my_button.dart';
import 'package:chatapps/components/my_textfield.dart';
import 'package:chatapps/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text controllers
  final emailController = TextEditingController();
  final passwordContoller = TextEditingController();
//sign in
  void signIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailandPAssword(
          emailController.text, passwordContoller.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 184, 184),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  //logo
                  Icon(
                    Icons.message,
                    size: 80,
                  ),
                  //welcome back message
                  Text(
                    "Welcome back you\'ve been misses!",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //email text field
                  MyTextFields(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false),
                  SizedBox(
                    height: 10,
                  ),
                  //pasword textfield
                  MyTextFields(
                      controller: passwordContoller,
                      hintText: 'Password',
                      obscureText: true),
                  SizedBox(
                    height: 25,
                  ),
                  //sign in button

                  MyButton(onTap: signIn, text: 'Sign in'),
                  SizedBox(
                    height: 50,
                  ),
                  //not a member?register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a Member?'),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register Now',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
