import 'dart:convert';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
abstract class CarData {
  static Future<void> registerCar(Car car, BuildContext context) async {
    final url = Uri.parse('http://localhost:5000/api/car/register'); // Replace with your API URL

    try {
      final register = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
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
          'ano': car.ano, // Corrected property name
          'cor': car.cor,
          'matricula': car.matricula,
          'seguro': car.seguro,
          'politicaCombustivel': car.politicaCombustivel,
          'preco': car.preco,
        }),
      );

      if (register.statusCode == 200) {
        // Car registered successfully
        print('Carro registado com sucesso!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Carro registado com sucesso!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBarPage(user: User.loggedUser!)), // Navigate to success page or home
        );
      } else {
        // Registration failed
        print('Falha ao registar o carro. Status code: ${register.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao registar o carro. Status code: ${register.statusCode}')),
        );
      }
    } catch (error) {
      // Handle other errors
      print('Erro ao registar o carro: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao registar o carro: $error')),
      );
    }
  }
}
