import 'dart:convert';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:adrenture/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class CarData {
static Future<void> registerCar(Car car, BuildContext context) async {
  final url = Uri.parse('http://' + servidor + ':' + porta + '/api/car/addCar'); // Replace with your API URL

  try {
    print('Sending POST request to $url');
    final register = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
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
        'ano': car.ano,
        'cor': car.cor,
        'matricula': car.matricula,
        'seguro': car.seguro,
        'politicaCombustivel': car.politicaCombustivel,
        'preco': car.preco,
      }),
    );

    print('Response status code: ${register.statusCode}');
    print('Response body: ${register.body}');

    if (register.statusCode == 200) {
      // Car registered successfully
      print('Carro registado com sucesso!');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Carro registado com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BottomNavBarPage(
                user: User.loggedUser!)), // Navigate to success page or home
      );
    } else {
      // Registration failed
      print('Falha ao registar o carro. Status code: ${register.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Falha ao registar o carro. Status code: ${register.statusCode}')),
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

  static Future<List<Car>> getAllCars() async {
    final url = Uri.parse('http://localhost:5000/api/car/getCars'); // Adjust the URL as needed

    final getAllCars = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (getAllCars.statusCode == 200) {
      print(getAllCars.body);
      List<dynamic> jsonResponse = json.decode(getAllCars.body);
      
      // Convert the JSON response to a list of User objects
      return jsonResponse.map((car) => Car.fromJson(car)).toList();
      
    } else {
      // Fetching users failed
      print('Failed to fetch users. Status code: ${getAllCars.statusCode}');
      throw Exception('Failed to fetch Cars');
    }
  }

}
