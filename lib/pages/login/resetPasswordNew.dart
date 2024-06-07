// ignore_for_file: file_names
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:flutter/material.dart';

class ResetPasswordNew extends StatelessWidget {
  ResetPasswordNew({super.key});

  final passwordController = TextEditingController();

  void goBack(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()));
  }

  void confirmar(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => goBack(context) , icon: const Icon(Icons.arrow_back, color:Color(0xFF3C9096))),
        title: const Text(
            'Insira a nova palavra-passe',
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
              ),
              const SizedBox(height: 100),

            //username textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Insira a palavra-passe',
              obscureText: true,
            ),

            const SizedBox(height: 30),

              MyTextField(
              controller: passwordController,
              hintText: 'Insira novamente a palavra-passe',
              obscureText: true,
            ),

            const SizedBox(height: 50),

            //Registar button
            MyButton(
              onTap:() => confirmar(context),
              text: "Confirmar",
            ),

            const SizedBox(height: 25),
          ],),
        ),
      )
    );
  }
}