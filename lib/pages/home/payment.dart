import 'package:adrenture/models/car.dart';
import 'package:adrenture/widgets/smallCard.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';

  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aluguer do Carro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            SmallCustomCard(
              title: carro1.marca + ' ' + carro1.modelo,
              subtitle: 'Data de Entrega: 29/06/2024',
              image: Image.asset(carro1.imagemPrincipal), // Ensure the image is in the assets folder
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 75),
            const Text(
              'Faturação',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Preço: 40€', style: TextStyle(fontSize: 18)),
            const Text('IVA: 5€', style: TextStyle(fontSize: 18)),
            const Text('Total: 45.00€', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            const Text(
              'Escolha o tipo de pagamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectPaymentMethod('PayPal');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset(
                    'assets/images/paypal.png',
                    height: 25,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectPaymentMethod('MB WAY');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset(
                    'assets/images/mbway.png',
                    height: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to payment page
                },
                child: Text(
                  'Continuar com $selectedPaymentMethod',
                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3C90C1),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}