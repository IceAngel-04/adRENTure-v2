import 'package:adrenture/components/button.dart';
import 'package:adrenture/components/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/pages/login/resetPasswordNew.dart';
import 'package:flutter/material.dart';

class resetPasswordEmail extends StatelessWidget {

  resetPasswordEmail({super.key});

    final emailController = TextEditingController();
  

   void goBack(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()));
  }

    void confirmar(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => resetPasswordNew()));
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
                        'Recuperar Palavra-passe',
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
              const SizedBox(height: 200),

            //username textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 150),

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