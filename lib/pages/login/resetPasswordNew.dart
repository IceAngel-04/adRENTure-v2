// ignore_for_file: file_names
import 'package:adrenture/data/user_data.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}
class _ResetPasswordState extends State<ResetPassword> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassworController = TextEditingController();

    void _resetPassword() {
    final user = User.forResetPassword(
      email: _emailController.text ,
      password: _passwordController.text,
      lastPassword: _confirmPassworController.text,
    );

    UserData.resetPasswordUser(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Palavra-passe redefinida com sucesso!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao redefinir a palavra-passe. Status code: $error')),
      );
    });
  }

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
            
            MyTextField(
              controller: _emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 30),


            //username textfield
            MyTextField(
              controller: _passwordController,
              hintText: 'Insira a palavra-passe',
              obscureText: true,
            ),

            const SizedBox(height: 30),

              MyTextField(
              controller: _confirmPassworController,
              hintText: 'Insira novamente a palavra-passe',
              obscureText: true,
            ),

            const SizedBox(height: 50),

            //Registar button
            MyButton(
              onTap: () {
                  _resetPassword();
                },
              text: "Confirmar",
            ),

            const SizedBox(height: 25),
          ],),
        ),
      )
    );
  }
}