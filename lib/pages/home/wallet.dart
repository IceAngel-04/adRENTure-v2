import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String selectedButton = 'totalGasto';

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
                  style: TextStyle(color: const Color.fromRGBO(5, 157, 2, 70)),
                ),
              ),
              TextButton(
                onPressed: () => updateContent('totalGanho'),
                child: const Text(
                  'Total Ganho',
                  style: TextStyle(color: const Color.fromRGBO(5, 157, 2, 70)),
                ),
              ),
              TextButton(
                onPressed: () => updateContent('lucro'),
                child: const Text(
                  'Lucro',
                  style: TextStyle(color: const Color.fromRGBO(5, 157, 2, 70)),
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
        return const GanhoContent();
      case 'lucro':
        return const LucroContent();
      case 'totalGasto':
      default:
        return const GastoContent();
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
  const GastoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Total Gasto: 150€',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class GanhoContent extends StatelessWidget {
  const GanhoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Total Ganho: 190€',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Valor de Comissão: 1.9€',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'Valor do IVA: 10€',
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
    return const Text(
      'Lucro: 40€',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class SalesData {
  final String car;
  final int sales;

  SalesData(this.car, this.sales);
}
