import 'package:adrenture/data/user_data.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/login/resetPasswordNew.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:adrenture/pages/login/register.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

 class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
  final user = User.forLogin(
    password: _passwordController.text,
    email: _emailController.text,
  );

  UserData.loginUser(user, context).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bem-vindo à adRENTure!')),
    );
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Falha ao iniciar-sessão. $error')),
    );
  });
}

  bool _passwordObscured = true;

  void togglePasswordVisibility() {
    setState(() {
      _passwordObscured = !_passwordObscured;
    });
  }


    void loginUser(BuildContext context, User user){
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarPage(user: User.loggedUser!)));
    }

    void forgotPassword(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPassword()));
    }
      
    void registerUser(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()));
    }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Bem-Vindo!',
                style: TextStyle(
                  color: Color(0xFF059D02),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

            //username textfield
            MyTextField(
              controller: _emailController,
              hintText: 'Email',

              obscureText: false,
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _passwordController,
                obscureText: _passwordObscured,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon : Icon(_passwordObscured 
                      ? Icons.visibility_outlined 
                      : Icons.visibility_off_outlined)
                      , color: Color(0xFF3C9096),
                      onPressed: togglePasswordVisibility,
                    ),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey
                  ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900)
                  ),
                  hintText: "Palavra-passe",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),

            const SizedBox(height: 25),
            //Esqueceu-se da palavra-passe?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => forgotPassword(context),
                  child: const Text(
                    'Esqueceu-se da palavra-passe?',
                    style: TextStyle(
                      color: Color(0xFF3C9096),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF3C9096),
                    ),
                  ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            MyButton(
              onTap: () {
                _login();
              },
              text: "Iniciar Sessão",
            ),

            const SizedBox(height: 50),

            //Crie uma conta
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => registerUser(context),
                  child: const Text(
                    'Crie uma conta',
                    style: TextStyle(
                      color: Color(0xFF3C9096),
                      fontWeight: FontWeight.bold,
                      decoration:TextDecoration.underline,
                     decorationColor: Color(0xFF3C9096),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
            )
          ],),
        ),
      )
    );
  }
}
