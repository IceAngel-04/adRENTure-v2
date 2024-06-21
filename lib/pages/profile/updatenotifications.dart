import 'package:adrenture/data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/button.dart';

class UpdateNotifications extends StatefulWidget {
  final User user;

  UpdateNotifications({Key? key, required this.user}) : super(key: key);

  @override
  _UpdateNotificationsState createState() => _UpdateNotificationsState();
}

class _UpdateNotificationsState extends State<UpdateNotifications> {
  bool notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    notificationsEnabled = widget.user.notificacoes ?? false;
  }

  void _updateNotifications() {
    User user = User.forUpdateNotifications(
      userID: widget.user.userID,
      notifications: notificationsEnabled,
    );

    UserData.updateNotifications(user, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notificações atualizadas com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileEditPage(user: widget.user)),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao atualizar as notificações. $error')),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Atualizar Notificações',
                style: TextStyle(
                  color: Color(0xFF059D02),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SwitchListTile(
                      title: const Text('Notificações'),
                      secondary: const Icon(Icons.notifications_outlined, color: Color(0xFF3C9096)),
                      value: notificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          notificationsEnabled = value;
                        });
                      },
                    ),
                    const SizedBox(height: 150),
                    MyButton(
                      onTap: _updateNotifications,
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
