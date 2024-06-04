import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:flutter/material.dart';


 void forgotPassword(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage()));
    }

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              title: Text('Alterar informações pessoais'),
              onTap: () => forgotPassword(context),
            ),
            SwitchListTile(
              title: Text('Notificações'),
              secondary: Icon(Icons.notifications_outlined),
              value: true,
              onChanged: (bool value) {
                // Ação ao alternar
              },
            ),
            SwitchListTile(
              title: Text('Modo escuro'),
              secondary: Icon(Icons.dark_mode_outlined),
              value: true,
              onChanged: (bool value) {
                // Ação ao alternar
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Sobre nós'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Política de privacidade'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Termos de serviço'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                // Ação ao clicar
              },
            ),
          ],
        ),
      ),
    );
  }
}