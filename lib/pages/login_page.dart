import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app/components/button.dart';
import 'package:social_app/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void signIn() async {
    showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator(),));
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);
    if(context.mounted) Navigator.pop(context);
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }
  void displayMessage(String message){
    showDialog(context: context, builder: (context)=>AlertDialog(title: Text(message),));
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
              
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
              
                  //welcome back
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
              
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
              
                  CustomTextField(
                      controller: emailTextController,
                      hintText: "Email",
                      obscureText: false),
              
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
              
                  CustomTextField(
                      controller: passwordTextController,
                      hintText: "Password",
                      obscureText: true),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  CustomButton(text: "Sign in",onTap: signIn,),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue),
                          )),
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
