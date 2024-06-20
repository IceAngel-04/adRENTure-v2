import 'package:adrenture/data/profile_data.dart';
import 'package:flutter/material.dart';

import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';

class UpdateAddress extends StatefulWidget {
  final User user;

  UpdateAddress({Key? key, required this.user}) : super(key: key);

  @override
  _UpdateAddressState createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  final TextEditingController _moradaController = TextEditingController();

  void _updateAddress() {
    User user = User.forUpdateAddress(
      userID: widget.user.userID, // Passa o userID do usuário
      morada: _moradaController.text
    );

    ProfileData.updateAddress(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Morada alterada com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileEditPage(user: widget.user)),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao alterar a morada. $error')),
      );
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

                    // Novo email textfield
                    MyTextField(
                      controller: _moradaController,
                      hintText: 'Nova morada',
                      obscureText: false,
                    ),

                    const SizedBox(height: 150),

                    // Confirm button
                    MyButton(
                      onTap: () => _updateAddress(),
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
