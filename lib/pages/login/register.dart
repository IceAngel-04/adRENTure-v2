import 'package:adrenture/components/button.dart';
import 'package:adrenture/components/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final userController = TextEditingController();
  final nifController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController(); //Trocar para date

    void registarUser(){

  }

  void registarUser2(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()));
  }
  
  void goBack(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(     
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => goBack(context),
                      child: Icon(Icons.arrow_circle_left),
                    ),
                    Expanded(
                      child: Text(
                        'Crie uma conta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

            //username textfield
            MyTextField(
              controller: userController,
              hintText: 'Nome do utilizador',
              obscureText: false,
            ),

            const SizedBox(height: 10),


            MyTextField(
              controller: nifController,
              hintText: 'NIF',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),

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

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.date_range_outlined),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey
                  ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900)
                  ),
                  hintText: "Data de nascimento",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),

            const SizedBox(height: 10),

            //Registar button
            MyButton(
              onTap:() => registarUser2(context),
              text: "Criar",
            ),

            const SizedBox(height: 25),
          ],),
        ),
      )
    );
  }
}