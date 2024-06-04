import 'package:adrenture/pages/login/resetPasswordEmail.dart';
import 'package:adrenture/pages/profile/updateAddress.dart';
import 'package:adrenture/pages/profile/updateEmail.dart';
import 'package:adrenture/pages/profile/updateNumber.dart';
import 'package:adrenture/pages/profile/updatePassword.dart';
import 'package:flutter/material.dart';


 void updatePassword(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdatePassword()));
    }
 void updateEmail(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateEmail()));
    }

 void updateNumber(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateNumber()));
    }

 void updateAddress(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateAddress()));
    }    

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person)
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perfil Nome',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('perfil@email.com'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Alterar palavra-passe'),
              onTap: () => updatePassword(context),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Alterar email'),
              onTap: () => updateEmail(context),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Alterar número de telemóvel'),
              onTap: () => updateNumber(context),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Alterar morada'),
              onTap: () => updateAddress(context),
            ),
          ],
        ),
      ),
    );
  }
}