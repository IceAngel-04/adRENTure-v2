import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';

void forgotPassword(BuildContext context, User user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ProfileEditPage(user: user)),
  );
}

void logout(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

void goBack(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => BottomNavBarPage(user: User.loggedUser!)),
  );
}

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({super.key, required this.user});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096)),
        ),
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Color(0xFF059D02),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.nomeUtilizador,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: Color(0xFF3C9096)),
              title: const Text('Alterar informações pessoais'),
              onTap: () => forgotPassword(context, user),
            ),
            SwitchListTile(
              title: const Text('Notificações'),
              secondary: const Icon(Icons.notifications_outlined, color: Color(0xFF3C9096)),
              value: true,
              onChanged: (bool value) {
                // Ação ao alternar
              },
            ),
            SwitchListTile(
              title: const Text('Modo escuro'),
              secondary: const Icon(Icons.dark_mode_outlined, color: Color(0xFF3C9096)),
              value: true,
              onChanged: (bool value) {
                // Ação ao alternar
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF3C9096)),
              title: const Text('Sobre nós'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF3C9096)),
              title: const Text('Política de privacidade'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF3C9096)),
              title: const Text('Termos de serviço'),
              onTap: () {
                // Ação ao clicar
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF3C9096)),
              title: const Text('Sair'),
              onTap: () => logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
