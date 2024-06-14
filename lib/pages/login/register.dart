import 'package:adrenture/data/user_data.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nomeUtilizadorController = TextEditingController();
  final _nifController = TextEditingController();
  final _cartaConducaoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _datanascimentoController = TextEditingController();

   void _register() {
    final user = User.forRegister(
      nomeUtilizador: _nomeUtilizadorController.text,
      password: _passwordController.text,
      nif: int.parse(_nifController.text),
      email: _emailController.text,
      cartaConducao: int.parse(_cartaConducaoController.text),
      datanascimento: DateTime.parse(_datanascimentoController.text),
    );

    UserData.registerUser(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register user: $error')),
      );
    });
  }


  void registarUser(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void goBack(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  bool _passwordObscured = true;

  void togglePasswordVisibility() {
    setState(() {
      _passwordObscured = !_passwordObscured;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _datanascimentoController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096)),
        ),
        title: const Text(
          'Crie uma nova conta',
          style: TextStyle(
            color: Color(0xFF059D02),
            fontSize: 25,
            fontWeight: FontWeight.bold,
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
              const SizedBox(height: 25),

              // Username textfield
              MyTextField(
                controller: _nomeUtilizadorController,
                hintText: 'Nome do utilizador',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // NIF textfield
              MyTextField(
                controller: _nifController,
                hintText: 'NIF',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: _cartaConducaoController,
                hintText: 'CartaConducao',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // Email textfield
              MyTextField(
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // Password textfield
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
                    hintText: "Palavra-passe",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Date of birth textfield with date picker
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _datanascimentoController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_outlined,
                        color: Color(0xFF3C9096)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    hintText: "Data de nascimento",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Register button
              MyButton(
                onTap: () {
                  _register();
                },
                text: "Criar",
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
