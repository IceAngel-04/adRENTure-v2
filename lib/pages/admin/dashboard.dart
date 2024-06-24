import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/admin/gerirCarro.dart';
import 'package:adrenture/pages/admin/gerirUser.dart';
import 'package:adrenture/pages/admin/stats.dart';
import 'package:adrenture/pages/home/profile.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:flutter/material.dart';

void gerirCarro(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const GerirCar()));
}

void gerirUsers(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => GerirUser()));
}

void verStats(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const StatsPage()));
}

void logout(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
}

void goBack(BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ProfilePage(user: User.loggedUser!)));
}

class DashboardPage extends StatelessWidget {
  final User user;
  const DashboardPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => goBack(context),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096))),
        title: const Text(
          'Painel do Administrador',
          style:
              TextStyle(color: Color(0xFF059D02), fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(radius: 40, child: Icon(Icons.person)),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Administrador' +  ' ' + user.nomeUtilizador,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.directions_car_outlined,
                  color: Color(0xFF3C9096)),
              title: const Text('Gerir Carros'),
              onTap: () => gerirCarro(context),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined,
                  color: Color(0xFF3C9096)),
              title: const Text('Gerir Utilizadores'),
              onTap: () => gerirUsers(context),
            ),
            ListTile(
              leading: const Icon(Icons.query_stats_outlined,
                  color: Color(0xFF3C9096)),
              title: const Text('Ver estatisticas'),
              onTap: () => verStats(context),
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
