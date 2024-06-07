// ignore_for_file: file_names
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final int userID;

  const UserPage({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    // Aqui você pode usar o ID para buscar os detalhes do carro e exibi-los
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do User $userID'),
      ),
      body: Center(
        child: Text('Detalhes do User $userID'),
      ),
    );
  }
}

