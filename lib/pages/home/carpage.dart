import 'package:adrenture/models/car.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/home/payment.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  final Car car;

  const CarPage({super.key, required this.car, required int carId});

  void goBack(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => BottomNavBarPage(user: User.loggedUser!)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(car.imagemPrincipal),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: IconButton(
                onPressed: () => goBack(context),
                icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096))),
            top: 30,
            left: 20,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(5, 157, 2, 70),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          '${car.marca} ${car.modelo}',
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Text(
                              car.nota.toString(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        SizedBox(
                          height: 100.0,
                          child: car.imagens.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: car.imagens.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(car.imagens[index]),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text(
                                    'Sem mais fotos',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Descrição: ${car.descricao}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Data de Entrega',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Data',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Dia',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                Text(
                                  '29/06',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Hora',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                Text(
                                  '19:23',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Características',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Tipo de Combustível: ${car.combustivel}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Nº de Portas: ${car.numeroPortas}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Nº de Lugares: ${car.numeroLugares}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Categoria: ${car.categoria}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Velocidade Máxima: ${car.velocidadeMax} km/h',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Transmissão: ${car.transmissao}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Cilindrada: ${car.cilindrada} CC',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Ano: ${car.ano}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Cor: ${car.cor}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Total de Quilômetros: ${car.totalQuilometros} km',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(height: 16.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PaymentPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF3C90C1), // Blue color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 16.0),
                            ),
                            child: Text(
                              '${car.preco.toStringAsFixed(2)}€',
                              style: const TextStyle(
                                  color: Colors.white), // White text
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
