// ignore_for_file: file_names
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/admin/dashboard.dart';
import 'package:adrenture/pages/home/profile.dart';
import 'package:adrenture/pages/profile/updateAddress.dart';
import 'package:adrenture/pages/profile/updateEmail.dart';
import 'package:adrenture/pages/profile/updateNumber.dart';
import 'package:adrenture/pages/profile/updatePassword.dart';
import 'package:flutter/material.dart';


 void goBack(BuildContext context, User user){
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => ProfilePage(user: user)));
 }

 void adminTest(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const DashboardPage()));
 }

 void updatePassword(BuildContext context, User user){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdatePassword(user: user)));
    }
 void updateEmail(BuildContext context, User user){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateEmail(user: user,)));
    }

 /*void updateNumber(BuildContext context, User user){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateNumber(user: user)));
    }*/

 void updateAddress(BuildContext context,User user){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateAddress(user: user)));
    }    

class ProfileEditPage extends StatelessWidget {
  final User user;

  ProfileEditPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => goBack(context, user) ,
         icon: const Icon(Icons.arrow_back,color: Color(0xFF3C9096))),
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
            Row(
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
                      user.nomeUtilizador,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(user.email),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Admin TEST'),
              onTap: () => adminTest(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar palavra-passe'),
              onTap: () => updatePassword(context, user),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar email'),
              onTap: () => updateEmail(context, user),
            ),
            /*ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar número de telemóvel'),
              onTap: () => updateNumber(context, user),
            ),*/
            ListTile(
              leading: const Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: const Text('Alterar morada'),
              onTap: () => updateAddress(context, user),
            ),
          ],
        ),
      ),
    );
  }
}