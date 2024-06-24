import 'package:adrenture/data/admin_data.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';
import 'package:flutter/material.dart';

class GerirUser2 extends StatefulWidget {
  final User user;

  GerirUser2({super.key, required this.user});

  @override
  _GerirUserState createState() => _GerirUserState();
}

class _GerirUserState extends State<GerirUser2> {
  final userController = TextEditingController();
  final nifController = TextEditingController();
  final cartaConducaoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userController.text = widget.user.nomeUtilizador;
    nifController.text = widget.user.nif.toString();
    cartaConducaoController.text = widget.user.cartaConducao.toString();
    emailController.text = widget.user.email;
    dobController.text = widget.user.datanascimento.toString();
  }

  void _updateUser() {
    final user = User(
      userID: widget.user.userID,
      nomeUtilizador: userController.text,
      nif: int.parse(nifController.text),
      cartaConducao: int.parse(cartaConducaoController.text),
      email: emailController.text,
      datanascimento: DateTime.parse(dobController.text),
      password: passwordController.text,
    );

    AdminData.updateUser(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Utilizador atualizado com sucesso')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao atualizar o utilizador. $error')),
      );
    });
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
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
        dobController.text = "${picked.toLocal()}".split(' ')[0];
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
          'Alterar utilizador',
          style: TextStyle(
            color: Color(0xFF059D02),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),

                  // Username textfield
                  MyTextField(
                    controller: userController,
                    hintText: 'Nome do utilizador',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // NIF textfield
                  MyTextField(
                    controller: nifController,
                    hintText: 'NIF',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // CartaConducao textfield
                  MyTextField(
                    controller: cartaConducaoController,
                    hintText: 'Carta de Condução',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: passwordController,
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
                      controller: dobController,
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

                  // Update button
                  MyButton(
                    onTap: () => _updateUser(),
                    text: "Alterar",
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}