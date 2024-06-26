import 'package:adrenture/data/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:adrenture/widgets/textfield.dart';

class UpdateNumber extends StatefulWidget {
  final User user;

  UpdateNumber({Key? key, required this.user}) : super(key: key);

  @override
  _UpdateNumberState createState() => _UpdateNumberState();
}

class _UpdateNumberState extends State<UpdateNumber> {
  final TextEditingController _telemovelController = TextEditingController();

  void _updateNumber() {
    User user = User.forUpdateNumber(
      userID: widget.user.userID, // Passa o userID do usuário
      telefone: int.parse(_telemovelController.text)
    );

    ProfileData.updateNumber(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Numero de telemovel alterado com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileEditPage(user: widget.user)),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao alterar o numero de telemovel. $error')),
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
                'Alterar o numero de telemovel',
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
                      controller: _telemovelController,
                      hintText: 'Novo numero de telemovel',
                      obscureText: false,
                    ),

                    const SizedBox(height: 150),

                    // Confirm button
                    MyButton(
                      onTap: () => _updateNumber(),
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
