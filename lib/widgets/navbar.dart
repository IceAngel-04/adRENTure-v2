import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/pages/home/wallet.dart';
import 'package:adrenture/pages/home/home.dart';
import 'package:adrenture/pages/home/activecarspage.dart';

class BottomNavBarPage extends StatefulWidget {
  final User user;

  const BottomNavBarPage({Key? key, required this.user}) : super(key: key);

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage(user: widget.user);
      case 1:
        return ActiveCarsPage();
      case 2:
        return WalletPage();
      case 3:
        return ProfilePage(user: widget.user);
      default:
        return HomePage(user: widget.user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Carros Ativos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Estatísticas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
        home: BottomNavBarPage(
            user: User.loggedUser ??
                User(
                    userID: 1,
                    nomeUtilizador: 'John Doe',
                    email: 'john.doe@example.com',
                    password: 'password123',
                    nif: 123456789,
                    datanascimento: DateTime(1990, 1, 1),
                    cartaConducao: 987654321)
                  )
                ),
  );
}
