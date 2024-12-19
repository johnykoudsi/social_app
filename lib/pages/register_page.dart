import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void signUp() async {
    showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator(),));
   if(passwordTextController.text != confirmPasswordTextController.text){
     Navigator.pop(context);
     displayMessage("Passwords don't match!");
   }
else{
     try{
       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);
       if(context.mounted) Navigator.pop(context);
     }on FirebaseAuthException catch(e){
       Navigator.pop(context);
       displayMessage(e.code);
     }
   }

  }
  void displayMessage(String message){
    showDialog(context: context, builder: (context)=>AlertDialog(title: Text(message),));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock,size: 100,),
              
                  SizedBox(height: screenHeight*0.05,),
              
                  //welcome back
                  Text('Lets create an account for you',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
              
                  SizedBox(height: screenHeight*0.02,),
              
                  CustomTextField(controller: emailTextController, hintText: "Email", obscureText: false),
              
                  SizedBox(height: screenHeight*0.01,),
              
                  CustomTextField(controller: passwordTextController, hintText: "Password", obscureText: true),
                  SizedBox(height: screenHeight*0.01,),
                  CustomTextField(controller: confirmPasswordTextController, hintText: "Confirm Password", obscureText: true),
                  SizedBox(height: screenHeight*0.02,),
                  CustomButton(text: "Sign Up",onTap: signUp,),
                  SizedBox(height: screenHeight*0.03,),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 4,),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),
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
