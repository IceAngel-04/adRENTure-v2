import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  final int carId;

  const CarPage({Key? key, required this.carId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Aqui você pode usar o ID para buscar os detalhes do carro e exibi-los
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Carro $carId'),
      ),
      body: Center(
        child: Text('Detalhes do Carro $carId'),
      ),
    );
  }
}


