import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/pages/login/resetPasswordNew.dart';
import 'package:flutter/material.dart';

class ResetPasswordEmail extends StatelessWidget {

  ResetPasswordEmail({super.key});

    final emailController = TextEditingController();
  

   void goBack(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()));
  }

    void confirmar(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ResetPasswordNew()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => goBack(context) , icon: const Icon(Icons.arrow_back, color:Color(0xFF3C9096))),
        title: const Text(
            'Insira o email',
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