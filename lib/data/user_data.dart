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
      print('Utilizador registado com sucesso!');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
    } else {
      // Registration failed
      print('Falha ao registar o utilizador. Status code: ${register.statusCode}');
    }
  }

static Future<Map<String, dynamic>> loginUser(User user, BuildContext context) async {
  final url = Uri.parse('http://localhost:5000/api/auth/login');
  final login = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'email': user.email,
      'password': user.password,
    }),
  );

  if (login.statusCode == 200) {
    // User logged in successfully
    Map<String, dynamic> jsonResponse = json.decode(login.body);
    print('Raw JSON Response: ${jsonResponse}');
    print('userID: ${jsonResponse['user']['userID']}');
    print('userType: ${jsonResponse['user']['userType']}');
    print('nomeUtilizador: ${jsonResponse['user']['nomeUtilizador']}');
    print('email: ${jsonResponse['user']['email']}');
    print('cartaConducao: ${jsonResponse['user']['cartaConducao']}');
    print('nif: ${jsonResponse['user']['nif']}');
    print('datanascimento: ${jsonResponse['user']['datanascimento']}');
    
    // Parsing integers from strings if needed
    int userID = int.parse(jsonResponse['user']['userID'].toString());
    int cartaConducao = int.parse(jsonResponse['user']['cartaConducao'].toString());
    int nif = int.parse(jsonResponse['user']['nif'].toString());

    User.loggedUser = User.currentUser(
      userID: userID,
      userType: jsonResponse['user']['userType'],
      nomeUtilizador: jsonResponse['user']['nomeUtilizador'],
      email: jsonResponse['user']['email'],
      cartaConducao: cartaConducao,
      nif: nif,
      datanascimento: DateTime.parse(jsonResponse['user']['datanascimento']),
    );
    print(login.body);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarPage(user: User.loggedUser!)),
    );
    
    return jsonResponse;
    
    } else {
      // Login failed
      print('Falha ao iniciar-sessão. Status code: ${login.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao iniciar-sessão.')),
      );
      throw Exception('Failed to login');
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
  
  static Future<void> updateNotifications(User user, BuildContext context) async {
    final url = Uri.parse('http://localhost:5000/api/user/updateNotifications');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'userID': user.userID,
        'notifications': user.notificacoes,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notificações atualizadas com sucesso!')),
      );
    } else {
      print('Falha ao atualizar as notificações. Status code: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao atualizar as notificações.')),
      );
      throw Exception('Failed to update notifications');
    }
  }
}
