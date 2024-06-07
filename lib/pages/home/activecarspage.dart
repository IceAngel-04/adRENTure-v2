import 'package:flutter/material.dart';

class ActiveCarsPage extends StatelessWidget {
  const ActiveCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Cars Page'),
      ),
      body: const Center(
        child: Text(
          'Página Carros Ativos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}