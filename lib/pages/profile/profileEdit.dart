import 'package:adrenture/pages/home/profile.dart';
import 'package:adrenture/pages/profile/updateAddress.dart';
import 'package:adrenture/pages/profile/updateEmail.dart';
import 'package:adrenture/pages/profile/updateNumber.dart';
import 'package:adrenture/pages/profile/updatePassword.dart';
import 'package:flutter/material.dart';


 void goBack(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const ProfilePage()));
 }

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
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => goBack(context) , icon: const Icon(Icons.arrow_back,color: Color(0xFF3C9096))),
        title: const Text('Profile Page',
        style: TextStyle(
          color: Color(0xFF059D02),
          fontWeight: FontWeight.bold
        ),),
      ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar palavra-passe'),
              onTap: () => updatePassword(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar email'),
              onTap: () => updateEmail(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar número de telemóvel'),
              onTap: () => updateNumber(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar morada'),
              onTap: () => updateAddress(context),
            ),
          ],
        ),
      ),
    );
  }
}