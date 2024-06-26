import 'package:adrenture/pages/home/activecarspage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importar para formatação de datas
import 'package:adrenture/models/car.dart'; // Supondo que 'car.dart' contém a definição da classe Car
import 'package:adrenture/widgets/smallCard.dart'; // Importe o widget SmallCustomCard se necessário

class PaymentPage extends StatefulWidget {
  final Car car;
  const PaymentPage({Key? key, required this.car, required int carId}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';
  late DateTime deliveryDate; // Data de entrega

  @override
  void initState() {
    super.initState();
    // Definir a data de entrega para amanhã à mesma hora
    deliveryDate = DateTime.now().add(Duration(days: 1));
  }

  // Método para calcular o preço com IVA
  double calculatePriceWithIVA(double price) {
    return price * 0.23; // IVA de 23%
  }

  // Método para calcular a taxa sobre o valor (preço + IVA)
  double calculateTaxValue(double priceWithIVA) {
    return priceWithIVA * 0.01;
  }

  // Método para lidar com a seleção do método de pagamento
  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    double preco = widget.car.preco; // Preço do carro
    double precoIVA = calculatePriceWithIVA(preco); // Preço com IVA
    double valorTaxa = calculateTaxValue(precoIVA); // Valor da taxa
    double total = preco + precoIVA + valorTaxa; // Total

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aluguer do Carro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            SmallCustomCard(
              title: '${widget.car.marca} ${widget.car.modelo}', // Nome do carro
              subtitle: DateFormat('yyyy-MM-dd HH:mm').format(deliveryDate), // Formatação da data de entrega
              image: Image.asset(widget.car.imagemPrincipal), // Imagem do carro (assegure que está na pasta assets)
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 75),
            const Text(
              'Faturação',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Preço: ${preco.toStringAsFixed(2)}€', style: TextStyle(fontSize: 18, color: const Color(0xFF3C90C1))),
                Text('IVA: ${precoIVA.toStringAsFixed(2)}€', style: TextStyle(fontSize: 18, color: const Color(0xFF3C90C1))),
                Text('Taxa: ${valorTaxa.toStringAsFixed(2)}€', style: TextStyle(fontSize: 18, color: const Color(0xFF3C90C1))),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF059D02)),
                ),
                Text('${total.toStringAsFixed(2)}€', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF059D02))),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'Escolha o tipo de pagamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120, // Largura fixa do botão
                  height: 50, // Altura fixa do botão
                  child: ElevatedButton(
                    onPressed: () {
                      selectPaymentMethod('PayPal');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedPaymentMethod == 'PayPal' ? Color(0xFF059D02) : const Color(0xFF3C90C1),
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/images/paypal.png',
                      height: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 120, // Largura fixa do botão
                  height: 50, // Altura fixa do botão
                  child: ElevatedButton(
                    onPressed: () {
                      selectPaymentMethod('MB WAY');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedPaymentMethod == 'MB WAY' ? Color(0xFF059D02) : const Color(0xFF3C90C1),
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/images/mbway.png',
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: selectedPaymentMethod.isEmpty
                  ? null
                     : () {
                        // Aqui você pode implementar a navegação para a página de pagamento ou outra ação
                        if (selectedPaymentMethod == 'PayPal') {
                          // Implemente a lógica para PayPal
                        } else if (selectedPaymentMethod == 'MB WAY') {
                          // Implemente a lógica para MB WAY
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ActiveCarsPage()),
                        );
                      },
                child: Text(
                  'Continuar com $selectedPaymentMethod',
                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedPaymentMethod.isEmpty ? Colors.grey : const Color(0xFF3C90C1),
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
