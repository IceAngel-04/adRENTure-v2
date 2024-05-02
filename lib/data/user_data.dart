import 'dart:convert';
import 'package:adrenture/models/user.dart';
import 'package:http/http.dart' as http;

abstract class UserData {
  static Future<void> registerUser(User user) async {
    // Exemplo de função de registrar
    final url = Uri.parse(''); // O vosso url da api para registrar

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': user.username,
        'password': user.password,
        'email': user.email,
      }),
    );

    if (response.statusCode == 200) {
      // User registered successfully
      print('User registered successfully');
    } else {
      // Registration failed
      print('Failed to register user. Status code: ${response.statusCode}');
    }
  }
}
