import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';


 void forgotPassword(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage()));
    }
    
    void logout(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()));
    }


   void goBack(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarPage()));
    }

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
        leading: IconButton(onPressed: () => goBack(context) , icon: Icon(Icons.arrow_back,color: Color(0xFF3C9096))),
        title: const Text('Profile Page',
          style: TextStyle(
            color: Color(0xFF059D02),
            fontWeight: FontWeight.bold),
          ),
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
              leading: Icon(Icons.settings_outlined,color: Color(0xFF3C9096)),
              title: Text('Alterar informações pessoais'),
              onTap: () => forgotPassword(context),
            ),
            SwitchListTile(
              title: Text('Notificações'),
              secondary: Icon(Icons.notifications_outlined,color: Color(0xFF3C9096)),
              value: true,
              onChanged: (bool value) {
                // Ação ao alternar
              },
            ),
            SwitchListTile(
              title: Text('Modo escuro'),
              secondary: Icon(Icons.dark_mode_outlined,color: Color(0xFF3C9096)),
              value: true,
              onChanged: (bool value) {
                // Ação ao alternar
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline,color: Color(0xFF3C9096)),
              title: Text('Sobre nós'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline,color: Color(0xFF3C9096)),
              title: Text('Política de privacidade'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline,color: Color(0xFF3C9096)),
              title: Text('Termos de serviço'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Color(0xFF3C9096)),
              title: Text('Sair'),
              onTap: () => logout(context), 
            ),
          ],
        ),
      ),
    );
  }
}