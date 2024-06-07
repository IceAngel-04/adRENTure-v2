import 'package:flutter/material.dart';

import 'package:adrenture/pages/home/profile.dart';
import 'package:adrenture/pages/home/wallet.dart';
import 'package:adrenture/pages/home/home.dart';
import 'package:adrenture/pages/home/activecarspage.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

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
        return const HomePage();
      case 1:
        return const ActiveCarsPage();
      case 2:
        return const WalletPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
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
  runApp(const MaterialApp(
    home: BottomNavBarPage(),
  ));
}
