// ignore_for_file: file_names
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
  final _newPasswordController = TextEditingController();
  final _confirmNewPassworController = TextEditingController();

    void _resetPassword() {

    /*UserData.resetPasswordUser(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Palavra-passe redefinida com sucesso!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao redefinir a palavra-passe. Status code: $error')),
      );
    });*/
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

  bool _newPasswordObscured = true;

  void toggleNewPasswordVisibility() {
    setState(() {
      _newPasswordObscured = !_newPasswordObscured;
  });
  }

  bool _confirmNewPasswordObscured = true;

  void toggleConfirmNewPasswordVisibility() {
    setState(() {
      _confirmNewPasswordObscured = !_confirmNewPasswordObscured;
  });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => goBack(context) , icon: const Icon(Icons.arrow_back, color:Color(0xFF3C9096))),
        title: const Text(
            'Redifinir a palavra-passe',
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

             Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                      controller: _newPasswordController,
                      obscureText: _newPasswordObscured,
                      decoration: InputDecoration(
                      suffixIcon: IconButton(
                      icon: Icon(_newPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      color: Color(0xFF3C9096),
                      onPressed: toggleNewPasswordVisibility,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    hintText: "Nova palavra-passe",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
            const SizedBox(height: 30),

           Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                      controller: _confirmNewPassworController,
                      obscureText: _confirmNewPasswordObscured,
                      decoration: InputDecoration(
                      suffixIcon: IconButton(
                      icon: Icon(_confirmNewPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      color: Color(0xFF3C9096),
                      onPressed: toggleConfirmNewPasswordVisibility,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    hintText: "Cofirme a nova palavra-passe",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
            const SizedBox(height: 50),
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