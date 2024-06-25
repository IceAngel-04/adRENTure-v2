import 'package:flutter/material.dart';
import 'package:adrenture/widgets/smallCard.dart';
import 'package:adrenture/models/car.dart';

class ActiveCarsPage extends StatefulWidget {
  const ActiveCarsPage({Key? key}) : super(key: key);

  @override
  _ActiveCarsPageState createState() => _ActiveCarsPageState();
}

class _ActiveCarsPageState extends State<ActiveCarsPage> {
  bool showAllCars = false; // State to track toggle button

  List<Car> carList = [
    carro1,
    carro2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text('${showAllCars ? 'Todos os Veiculos Alugados' : 'Atualmente Alugados'}'),
            ),
            Switch(
              value: showAllCars,
              onChanged: (value) {
                setState(() {
                  showAllCars = value;
                });
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: showAllCars ? carList.length : 5, // Display all or first 5 cars
        itemBuilder: (context, index) {
          final car = carList[index];
          return SmallCustomCard(
            title: '${car.marca} ${car.modelo}',
            subtitle:
                'Tempo Restante: ${car.preco} Horas e ${car.totalQuilometros} minutos',
            image: Image.asset(
                car.imagemPrincipal), // Use the car image from assets
            backgroundColor: const Color.fromRGBO(5, 157, 2, 70),
          );
        },
      ),
    );
  }
}
