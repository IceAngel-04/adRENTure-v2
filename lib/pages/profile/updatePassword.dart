import 'package:adrenture/data/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';

class UpdatePassword extends StatefulWidget {
  final User user;

  UpdatePassword({Key? key, required this.user}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordConfirmController = TextEditingController();


  void _updatePassword() {
    User user = User.forUpdatePassword(
      userID: widget.user.userID, // Passa o userID do usuário
      password: _passwordController.text,
      newPassword: _newPasswordController.text,
      newPasswordConfirm: _newPasswordConfirmController.text
    );

    ProfileData.updatePassword(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Palavra-Passe alterado com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileEditPage(user: widget.user)),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao alterar a palavra-passe. $error')),
      );
    });
  }

  bool _passwordObscured = true;

  void togglePasswordVisibility() {
    setState(() {
      _passwordObscured = !_passwordObscured;
    });
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


  void goBack(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage(user: widget.user)),
    );
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
                'Alterar a Palavra-Passe',
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
                    const SizedBox(height: 100),

                    // Novo email textfield
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                      controller: _passwordController,
                      obscureText: _passwordObscured,
                      decoration: InputDecoration(
                      suffixIcon: IconButton(
                      icon: Icon(_passwordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      color: Color(0xFF3C9096),
                      onPressed: togglePasswordVisibility,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    hintText: "Palavra-passe atual",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
                    
                    const SizedBox(height: 20),
                         // Novo email textfield
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
                    hintText: "Nova Palavra-passe",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
                    
                    
                    const SizedBox(height: 20),

                         // Novo email textfield
                       Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                      controller: _newPasswordConfirmController,
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
                    hintText: "Confirma a nova Palavra-passe",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
                    
                    const SizedBox(height: 100),

                    // Confirm button
                    MyButton(
                      onTap: () => _updatePassword(),
                      text: "Confirmar",
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
