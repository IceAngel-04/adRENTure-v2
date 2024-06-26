import 'dart:convert';
import 'package:adrenture/main.dart';
import 'package:adrenture/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String selectedButton = 'totalGasto';

  @override
  void initState() {
    super.initState();
    fetchTotals();
  }

  Future<void> fetchTotals() async {
    if (User.loggedUser != null) {
      try {
        await ProfileService.getTotalSpent(User.loggedUser!.userID.toString());
        await ProfileService.getTotalEarned(User.loggedUser!.userID.toString());
        setState(() {}); // Atualiza a UI com os novos valores
      } catch (error) {
        print('Failed to fetch totals: $error');
      }
    }
  }

  void updateContent(String buttonType) {
    setState(() {
      selectedButton = buttonType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saldo'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => updateContent('totalGasto'),
                child: const Text(
                  'Despesa Total',
                  style: TextStyle(color: Color.fromRGBO(5, 157, 2, 70)),
                ),
              ),
              TextButton(
                onPressed: () => updateContent('totalGanho'),
                child: const Text(
                  'Total Ganho',
                  style: TextStyle(color: Color.fromRGBO(5, 157, 2, 70)),
                ),
              ),
              TextButton(
                onPressed: () => updateContent('lucro'),
                child: const Text(
                  'Lucro',
                  style: TextStyle(color: Color.fromRGBO(5, 157, 2, 70)),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: getContent(selectedButton),
            ),
          ),
          if (selectedButton == 'lucro') Expanded(child: getBarChart())
        ],
      ),
    );
  }

  Widget getContent(String buttonType) {
    switch (buttonType) {
      case 'totalGanho':
        return GanhoContent();
      case 'lucro':
        return const LucroContent();
      case 'totalGasto':
      default:
        return GastoContent();
    }
  }

  Widget getBarChart() {
    var data = [
      SalesData('Ford Fiesta', 150),
      SalesData('Opel Astra', 250),
      SalesData('BMW 220', 200),
      SalesData('Peugeot 208', 180),
      SalesData('Renault Megane', 180),
    ];

    var series = [
      charts.Series(
        id: 'Sales',
        data: data,
        domainFn: (SalesData sales, _) => sales.car,
        measureFn: (SalesData sales, _) => sales.sales,
      )
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: charts.BarChart(series),
    );
  }
}

class GastoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalGasto = User.loggedUser?.valorGasto ?? 0.0;
    return Text(
      'Total Gasto: ${totalGasto.toStringAsFixed(2)}€',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class GanhoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalGanho = User.loggedUser?.valorGanho ?? 0.0;
    final valorComissao = totalGanho * 0.01; // Exemplo de cálculo
    final valorIva = totalGanho * 0.23; // Valor fixo como exemplo

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total Ganho: ${totalGanho.toStringAsFixed(2)}€',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Valor de Comissão: ${valorComissao.toStringAsFixed(2)}€',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'Valor do IVA: ${valorIva.toStringAsFixed(2)}€',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class LucroContent extends StatelessWidget {
  const LucroContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalGanho = User.loggedUser?.valorGanho ?? 0.0;
    final totalGasto = User.loggedUser?.valorGasto ?? 0.0;
    final lucro = totalGanho - totalGasto;

    return Text(
      'Lucro: ${lucro.toStringAsFixed(2)}€',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class SalesData {
  final String car;
  final int sales;

  SalesData(this.car, this.sales);
}

class ProfileService {

  static Future<void> getTotalSpent(String userID) async {
    final url = Uri.parse('http://$servidor:$porta/getTotalSpent?userID=$userID');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (User.loggedUser != null) {
        User.loggedUser!.valorGasto = data['totalSpent'];
      }
    } else {
      throw Exception('Failed to fetch total spent. Status code: ${response.statusCode}');
    }
  }

  static Future<void> getTotalEarned(String userID) async {
    final url = Uri.parse('http://$servidor:$porta/getTotalEarned?userID=$userID');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (User.loggedUser != null) {
        User.loggedUser!.valorGanho = data['totalEarned'];
      }
    } else {
      throw Exception('Failed to fetch total earned. Status code: ${response.statusCode}');
    }
  }
}
