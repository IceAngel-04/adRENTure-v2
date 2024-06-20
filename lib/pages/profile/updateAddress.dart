// ignore_for_file: file_names
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:flutter/material.dart';

class UpdateAddress extends StatelessWidget {
  final User user;
  UpdateAddress({super.key,required this.user });

    final addressController = TextEditingController();
  

   void goBack(BuildContext context, User user){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileEditPage(user: user)));
  }

    void confirmar(BuildContext context, User user){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileEditPage(user: user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => goBack(context, user),
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
                'Alterar a morada',
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
              controller: addressController,
              hintText: 'Morada',
              obscureText: false,
            ),

            const SizedBox(height: 150),

            //Registar button
            MyButton(
              onTap:() => confirmar(context, user),
              text: "Confirmar",
            ),

            const SizedBox(height: 25),
          ],),
        ),
      )
      ],
      ),
      )
    );
  }
}