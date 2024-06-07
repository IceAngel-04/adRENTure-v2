// ignore_for_file: file_names
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:flutter/material.dart';

class UpdateNumber extends StatelessWidget {

  UpdateNumber({super.key});

    final numberController = TextEditingController();
  

   void goBack(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProfileEditPage()));
  }

    void confirmar(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProfileEditPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Alterar o número de telemóvel',
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                    ),
                    const SizedBox(height: 150),

            //username textfield
            MyTextField(
              controller: numberController,
              hintText: 'Número de telemóvel',
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
      ]
      )
      )
    );
  }
}