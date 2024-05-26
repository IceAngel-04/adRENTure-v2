import 'package:adrenture/components/button.dart';
import 'package:adrenture/components/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:flutter/material.dart';

class resetPasswordNew extends StatelessWidget {
  resetPasswordNew({super.key});

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
                        'Insira a nova palavra-passe',
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