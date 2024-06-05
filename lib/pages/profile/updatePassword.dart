import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: Icon(Icons.arrow_back, color: Color(0xFF3C9096)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Alterar a palavra-passe',
                style: TextStyle(
                  color: Color(0xFF059D02),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Body content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                    ),
                    const SizedBox(height: 80),

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
      ] 
      )
      )
    );
  }
}