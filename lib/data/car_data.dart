import 'dart:convert';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:adrenture/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class CarData {
  static Future<List<Car>> getAllCars() async {
    final response = await http.get(
        Uri.parse('http://' + servidor + ':' + porta + '/api/car/getCars'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<Car> cars = jsonData.map((item) => Car.fromJson(item)).toList();
      print(response.body);
      return cars;
    } else {
      throw Exception('Failed to load cars');
    }
  }

  static Future<void> registerCar(Car car, BuildContext context) async {
    final url = Uri.parse('http://' +
        servidor +
        ':' +
        porta +
        '/api/car/addCar'); // Replace with your API URL

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
          'ano': car.ano.year,
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

  static Future<List<Car>> getBoughtUserCars() async {
    final response = await http.get(
      Uri.parse('http://' + servidor + ':' + porta + '/api/car/getboughtUserCars'));
      print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> carJson = json.decode(response.body);
      return carJson.map((json) => Car.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rented user cars');
    }
  }

  static Future<List<Car>> getAllUserCars() async {
    final response = await http.get(
      Uri.parse('http://' + servidor + ':' + porta + '/api/car/getAllUserCars')); 
    if (response.statusCode == 200) {
      final List<dynamic> carJson = json.decode(response.body);
      return carJson.map((json) => Car.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rented cars');
    }
  }
}
