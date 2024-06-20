import 'dart:convert';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/pages/profile/updateNumber.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
abstract class ProfileData {

  static Future<void> updateEmail(User user, BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://localhost:5000/api/profile/updateEmail'); // O vosso url da api para registrar
    //final url = Uri.parse('https://adrentureapi.onrender.com/api/auth/register'); // O vosso url da api para registrar

    final updateEmail = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'userID': user.userID,
        'novoEmail': user.novoEmail
      }),
    );
    if (updateEmail.statusCode == 200) {
      // User registered successfully
      print('Email updated!');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage(user: User.loggedUser!)),
    );
    } else {
      // Registration failed
      print('Falha ao registar o utilizador. Status code: ${updateEmail.statusCode}');
    }
  }

  
  static Future<void> updateNumber(User user, BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://localhost:5000/api/profile/updateEmail'); // O vosso url da api para registrar
    //final url = Uri.parse('https://adrentureapi.onrender.com/api/auth/register'); // O vosso url da api para registrar

    final updateNumber = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'userID': user.userID,
        'telemovel': user.telefone
      }),
    );
    if (updateNumber.statusCode == 200) {
      // User registered successfully
      print('Number updated!');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage(user: User.loggedUser!)),
    );
    } else {
      // Registration failed
      print('Falha ao registar o utilizador. Status code: ${updateNumber.statusCode}');
    }
  }

   static Future<void> resetPasswordUser(User user,BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://localhost:5000/api/auth/resetPassword'); // O vosso url da api para registrar
    //final url = Uri.parse('https://adrentureapi.onrender.com/api/auth/login'); // O vosso url da api para registrar

    final resetPassword = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'newPassword': user.password,
        'confirmPassword': user.lastPassword
      }),
    );
    
    if (resetPassword.statusCode == 200) {
      // User logged successfully
      print('Palavra-passe redefinida com sucesso!');
      SnackBar(content: Text('Palavra-passe redefinida com sucesso!'));
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()));
    } else {
      // Login failed
      print('Falha ao redefinir a palavra-passe. Status code: ${resetPassword.statusCode}');
      SnackBar(content: Text('Falha ao redefinir a palavra-passe.'));
    }
  }
}