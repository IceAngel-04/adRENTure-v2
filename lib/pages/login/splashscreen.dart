import 'dart:async';
import 'package:flutter/material.dart';

import 'package:adrenture/widgets/navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      // Navegar para a HomePage após 3 segundos
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBarPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Coloque o caminho da sua imagem aqui
          width: 200, // Ajuste conforme necessário
          height: 200, // Ajuste conforme necessário
        ),
      ),
    );
  }
}

