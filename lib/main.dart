import 'package:adrenture/pages/login/splashscreen.dart';
import 'package:flutter/material.dart';

String servidor = "localhost";
String porta = "5000";
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
