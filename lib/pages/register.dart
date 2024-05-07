import 'package:chatapps/components/my_button.dart';
import 'package:chatapps/components/my_textfield.dart';
import 'package:chatapps/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //text controllers
  final emailController = TextEditingController();
  final passwordContoller = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final namecontroller = TextEditingController();
//sign up user
  void signUp() async {
    if (passwordContoller.text != confirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match!"),
        ),
      );
      return;
    }
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordContoller.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
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
                  //create account message
                  Text(
                    "Let's Create an account for you!",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextFields(
                      controller: namecontroller,
                      hintText: "Name",
                      obscureText: false),
                  SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  //confirm password
                  MyTextFields(
                      controller: confirmpasswordController,
                      hintText: 'Confirm password',
                      obscureText: true),
                  SizedBox(
                    height: 25,
                  ),
                  //sign up button

                  MyButton(onTap: signUp, text: 'Sign Up'),
                  SizedBox(
                    height: 50,
                  ),
                  //not a member?register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already a Member?'),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login Now',
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
