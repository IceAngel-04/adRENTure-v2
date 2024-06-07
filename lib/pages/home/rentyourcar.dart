import 'package:flutter/material.dart';

class RentYourCarPage extends StatelessWidget {
  const RentYourCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent Your Car Page'),
      ),
      body: const Center(
        child: Text(
          'Página Alugue o seu Carro',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}