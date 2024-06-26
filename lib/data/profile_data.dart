import 'dart:convert';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ProfileData {

  static Future<void> updateEmail(User user, BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://' + servidor + ':' + porta + '/api/profile/updateEmail'); // O vosso url da api para registrar

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
    final url = Uri.parse('http://' + servidor + ':' + porta + '/api/profile/updateNumber'); // O vosso url da api para registrar

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
      print('Falha ao atualizar o numero de telemovel. Status code: ${updateNumber.statusCode}');
    }
  }

    static Future<void> updateAddress(User user, BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://' + servidor + ':' + porta + '/api/profile/updateAddress'); // O vosso url da api para registrar

    final updateAddress = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'userID': user.userID,
        'morada': user.morada
      }),
    );
    if (updateAddress.statusCode == 200) {
      // User registered successfully
      print('Morada updated!');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage(user: User.loggedUser!)),
    );
    } else {
      // Registration failed
      print('Falha ao atualizar a morada. Status code: ${updateAddress.statusCode}');
    }
  }

  static Future<void> updatePassword(User user, BuildContext context) async {
    // Exemplo de função de registrar
    final url = Uri.parse('http://' + servidor + ':' + porta + '/api/profile/updatePassword'); // O vosso url da api para registrar

    final updatePassword = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'userID': user.userID,
        'password': user.password,
        'newPassword': user.newPassword,
        'newPasswordConfirm': user.newPasswordConfirm
        
      }),
    );
    if (updatePassword.statusCode == 200) {
      // User registered successfully
      print('Morada updated!');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileEditPage(user: User.loggedUser!)),
    );
    } else {
      // Registration failed
      print('Falha ao atualizar a morada. Status code: ${updatePassword.statusCode}');
    }
  }

  static Future<void> getTotalSpent(String userID) async {
    final url = Uri.parse('http://$servidor:$porta/getTotalSpent?userID=$userID');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (User.loggedUser != null) {
        User.loggedUser!.valorGasto = data['totalSpent'];
      }
    } else {
      throw Exception('Failed to fetch total spent. Status code: ${response.statusCode}');
    }
  }

  static Future<void> getTotalEarned(String userID) async {
    final url = Uri.parse('http://$servidor:$porta/getTotalEarned?userID=$userID');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (User.loggedUser != null) {
        User.loggedUser!.valorGanho = data['totalEarned'];
      }
    } else {
      throw Exception('Failed to fetch total earned. Status code: ${response.statusCode}');
    }
  }

 static Future<bool> updateNotifications(User user, bool newValue) async {
    try {
      final url = Uri.parse('http://' + servidor + ':' + porta + '/api/profile/updateNotifications');

      final updateNotification = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'userID': user.userID,
          'notifications': user.notificacoes,
        }),
      );

      if (updateNotification.statusCode == 200) {
        return true; // Notifications updated successfully
      } else {
        throw Exception('Failed to update notifications. Status code: ${updateNotification.statusCode}');
      }
    } catch (error) {
      throw Exception('Error updating notifications: $error');
    }
  }
}
