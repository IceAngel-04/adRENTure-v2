import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatelessWidget {
  UpdatePassword({super.key});

  final passwordController = TextEditingController();

  void goBack(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileEditPage()));
  }

  void confirmar(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileEditPage()));
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
                        'Alterar a palavra-passe',
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
              hintText: 'Insira a palavra-passe atual',
              obscureText: true,
            ),

            const SizedBox(height: 30),

              MyTextField(
              controller: passwordController,
              hintText: 'Insira a palavra-passe nova',
              obscureText: true,
            ),


            const SizedBox(height: 30),

              MyTextField(
              controller: passwordController,
              hintText: 'Insira novamente a palavra-passe nova',
              obscureText: true,
            ),

            const SizedBox(height: 50),

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