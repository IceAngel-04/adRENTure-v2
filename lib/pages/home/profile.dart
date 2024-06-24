import 'package:adrenture/pages/admin/dashboard.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/models/user.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  void _updateNotifications(bool newValue) {
    setState(() {
      notificationsEnabled = newValue;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Notificações atualizadas com sucesso!')),
    );
  }

  void goToDashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage(user: widget.user)),
    );
  }

  void goToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage(user: widget.user)),
    );
  }

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void goBack() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarPage(user: User.loggedUser!)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: goBack,
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
                    Text(
                      widget.user.nomeUtilizador,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.user.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            if (widget.user.userType == 'admin')
              ListTile(
                leading: const Icon(Icons.dashboard, color: Color(0xFF3C9096)),
                title: const Text('Ir para o Dashboard'),
                onTap: goToDashboard,
              ),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: Color(0xFF3C9096)),
              title: const Text('Alterar informações pessoais'),
              onTap: goToEditProfile,
            ),
            SwitchListTile(
              title: const Text('Notificações'),
              secondary: const Icon(Icons.notifications_outlined, color: Color(0xFF3C9096)),
              value: notificationsEnabled,
              onChanged: _updateNotifications,
            ),
            SwitchListTile(
              title: const Text('Modo escuro'),
              secondary: const Icon(Icons.dark_mode_outlined, color: Color(0xFF3C9096)),
              value: darkModeEnabled,
              onChanged: null,
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF3C9096)),
              title: const Text('Sobre nós'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF3C9096)),
              title: const Text('Política de privacidade'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF3C9096)),
              title: const Text('Termos de serviço'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF3C9096)),
              title: const Text('Sair'),
              onTap: logout,
            ),
          ],
        ),
      ),
    );
  }
}
