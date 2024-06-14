import 'dart:convert';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
abstract class UserData {
  static Future<void> registerUser(User user, BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://localhost:5000/api/auth/register'); // O vosso url da api para registrar
    //final url = Uri.parse('https://adrentureapi.onrender.com/api/auth/register'); // O vosso url da api para registrar

    final register = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        //"Access-Control-Allow-Origin": "*", // Required for CORS support to work
        //"Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        //"Access-Control-Allow-Methods": "POST, OPTIONS"
      },
      body: jsonEncode(<String, dynamic>{
        'nomeUtilizador': user.nomeUtilizador,
        'password': user.password,
        'email': user.email,
        'nif': user.nif,
        'dataNascimento': user.datanascimento.toString(),
        'cartaConducao': user.cartaConducao,
      }),
    );
    if (register.statusCode == 200) {
      // User registered successfully
      print('User registered successfully');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
    } else {
      // Registration failed
      print('Failed to register user. Status code: ${register.statusCode}');
    }
  }

  static Future<void> loginUser(User user,BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://localhost:5000/api/auth/login'); // O vosso url da api para registrar
    //final url = Uri.parse('https://adrentureapi.onrender.com/api/auth/login'); // O vosso url da api para registrar

    final login = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': user.password,
      }),
    );
    if (login.statusCode == 200) {
      // User logged successfully
      print('User logged successfully');
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavBarPage()));
    } else {
      // Login failed
      print('Failed to login user. Status code: ${login.statusCode}');
    }
  }



}