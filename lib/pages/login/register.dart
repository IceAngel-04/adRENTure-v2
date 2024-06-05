import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
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
      appBar: AppBar(
        leading: IconButton(onPressed: () => goBack(context) , icon: Icon(Icons.arrow_back, color:Color(0xFF3C9096))),
        title: const Text(
            'Crie uma nova conta',
            style: TextStyle(
              color: Color(0xFF059D02),
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
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
                  suffixIcon: Icon(Icons.remove_red_eye_outlined, color:Color(0xFF3C9096)),
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
                  suffixIcon: Icon(Icons.date_range_outlined, color:Color(0xFF3C9096)),
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