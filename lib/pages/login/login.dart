// import 'dart:js';

import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:adrenture/pages/login/register.dart';
import 'package:adrenture/pages/login/resetPasswordEmail.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  Login({super.key});

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void loginUser(){

  }

    void loginUser2(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarPage()));
    }

    void forgotPassword(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => resetPasswordEmail()));
    }

    void registerUser(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                'Bem-Vindo!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

            //username textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',

              obscureText: false,
            ),

            const SizedBox(height: 10),
            //password textfield
            /*MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),*/

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey
                  ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900)
                  ),
                  hintText: "Palavra-passe",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),

            const SizedBox(height: 25),
            //Esqueceu-se da palavra-passe?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => forgotPassword(context),
                  child: Text(
                    'Esqueceu-se da palavra-passe?',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      ),
                  
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
                  ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //Iniciar sessao button
            MyButton(
              //onTap: loginUser,
              onTap: () => loginUser2(context),
              text: "Iniciar Sessão",
            ),

            const SizedBox(height: 50),

            //Crie uma conta
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => registerUser(context),
                  child: Text(
                    'Crie uma conta',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      decoration:TextDecoration.underline
                      ),
                    
                    ),
                ),
                const SizedBox(width: 4),
              ],
            )
          ],),
        ),
      )
    );
  }
}
