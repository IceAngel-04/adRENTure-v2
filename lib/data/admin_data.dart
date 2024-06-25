import 'dart:convert';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/admin/gerirCarro.dart';
import 'package:adrenture/pages/admin/gerirUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


abstract class AdminData {
  static Future<void> updateUser(User user, BuildContext context) async {
    final url = Uri.parse('http://localhost:5000/api/admin/updateUser'); // O vosso url da api para registrar
    //final url = Uri.parse('https://adrentureapi.onrender.com/api/auth/register'); // O vosso url da api para registrar

    final updateUser = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'userID': user.userID,
        'nomeUtilizador': user.nomeUtilizador,
        'password': user.password != null ?user.password : '',
        'email': user.email,
        'nif': user.nif,
        'dataNascimento': user.datanascimento.toString(),
        'cartaConducao': user.cartaConducao,
      }),
    );
    if (updateUser.statusCode == 200) {
      // User registered successfully
      print('Utilizador atualizado com sucesso!');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GerirUser()),
    );
    } else {
      // Registration failed
      print('Falha ao atualizar o utilizador. Status code: ${updateUser.statusCode}');
    }
  }

  static Future<void> deleteUser(User user) async {
    final url = Uri.parse('http://localhost:5000/api/admin/deleteUser'); // O vosso url da api para registrar
    //final url = Uri.parse('https://adrentureapi.onrender.com/api/auth/register'); // O vosso url da api para registrar

    final deleteUser = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, int>{
        'userID': user.userID
      }),
    );
    if (deleteUser.statusCode == 200) {
      // User registered successfully
      print('Utilizador apagado com sucesso!');
    } else {
      // Registration failed
      print('Falha ao apagar o utilizador. Status code: ${deleteUser.statusCode}');
    }
  }

  static Future<List<User>> getAllUsers() async {
    final url = Uri.parse('http://localhost:5000/api/admin/getAllUsers'); // Adjust the URL as needed

    final getAllUsers = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (getAllUsers.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(getAllUsers.body);
      // Convert the JSON response to a list of User objects
      return jsonResponse.map((user) => User.fromJson(user)).toList();
      
    } else {
      // Fetching users failed
      print('Failed to fetch users. Status code: ${getAllUsers.statusCode}');
      throw Exception('Failed to fetch users');
    }
  }

     static Future<void> updateCar(Car car, BuildContext context) async {
    final url = Uri.parse('http://localhost:5000/api/car/updateCar'); // Adjust the URL as needed

    final updateCar = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
          'carroID': car.id,
          'locador': car.dono, // Ensure this is the user ID
          'descricao': car.descricao,
          'marca': car.marca,
          'modelo': car.modelo,
          'combustivel': car.combustivel,
          'nPortas': car.numeroPortas,
          'nLugares': car.numeroLugares,
          'categoria': car.categoria,
          'velocidadeMax': car.velocidadeMax,
          'transmissao': car.transmissao,
          'totalQuilometros': car.totalQuilometros,
          'cilindrada': car.cilindrada,
          'ano': car.ano.year,
          'cor': car.cor,
          'matricula': car.matricula,
          'seguro': car.seguro,
          'politicaCombustivel': car.politicaCombustivel,
          'preco': car.preco,
          'ativo': car.ativo
      }),
    );
    print(updateCar.body);
    if (updateCar.statusCode == 200) {
      // User registered successfully
      print('Carro atualizado com sucesso!');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GerirCar(user: User.loggedUser!)),
    );
    } else {
      // Registration failed
      print('Falha ao atualizar o carro. Status code: ${updateCar.statusCode}');
    }
  }

  static Future<void> deleteCar(Car car) async {
    final url = Uri.parse('http://localhost:5000/api/car/deleteCar'); // Replace with your actual API endpoint
    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'carroID': car.id,
        }),
      );

      if (response.statusCode == 200) {
        print('Carro apagado com sucesso!');
      } else {
        print('Falha ao apagar o carro. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Falha ao apagar o carro. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição HTTP: $e');
      throw Exception('Falha ao apagar o carro: $e');
    }
  }
}