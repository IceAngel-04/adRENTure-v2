import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final int userID;

  const UserPage({Key? key, required this.userID}) : super(key: key);

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

