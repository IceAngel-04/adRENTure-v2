import 'package:adrenture/models/marcas.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Brand> marcas = [
      Brand(id: 1, nomeMarca: 'BMW'),
      Brand(id: 2, nomeMarca: 'Audi'),
      Brand(id: 3, nomeMarca: 'Mercedes-Benz'),
      Brand(id: 4, nomeMarca: 'Toyota'),
      Brand(id: 5, nomeMarca: 'Honda'),
      Brand(id: 6, nomeMarca: 'Ford'),
      Brand(id: 7, nomeMarca: 'Chevrolet'),
      Brand(id: 8, nomeMarca: 'Volkswagen'),
      Brand(id: 9, nomeMarca: 'Hyundai'),
      Brand(id: 10, nomeMarca: 'Nissan'),
      Brand(id: 11, nomeMarca: 'Kia'),
      Brand(id: 12, nomeMarca: 'Peugeot'),
      Brand(id: 13, nomeMarca: 'Fiat'),
      Brand(id: 14, nomeMarca: 'Renault'),
      Brand(id: 15, nomeMarca: 'Mazda'),
      Brand(id: 16, nomeMarca: 'Subaru'),
      Brand(id: 17, nomeMarca: 'Jaguar'),
      Brand(id: 18, nomeMarca: 'Land Rover'),
      Brand(id: 19, nomeMarca: 'Volvo'),
      Brand(id: 20, nomeMarca: 'Lexus'),
      Brand(id: 21, nomeMarca: 'Acura'),
      Brand(id: 22, nomeMarca: 'Infiniti'),
      Brand(id: 23, nomeMarca: 'Mitsubishi'),
      Brand(id: 24, nomeMarca: 'Suzuki'),
      Brand(id: 25, nomeMarca: 'Porsche'),
      Brand(id: 26, nomeMarca: 'Ferrari'),
      Brand(id: 27, nomeMarca: 'Lamborghini'),
      Brand(id: 28, nomeMarca: 'Maserati'),
      Brand(id: 29, nomeMarca: 'Alfa Romeo'),
      Brand(id: 30, nomeMarca: 'Bentley'),
      Brand(id: 31, nomeMarca: 'Rolls-Royce'),
      Brand(id: 32, nomeMarca: 'Aston Martin'),
      Brand(id: 33, nomeMarca: 'Bugatti'),
      Brand(id: 34, nomeMarca: 'Tesla'),
      Brand(id: 35, nomeMarca: 'McLaren'),
      Brand(id: 36, nomeMarca: 'Pagani'),
      Brand(id: 37, nomeMarca: 'Koenigsegg'),
      Brand(id: 38, nomeMarca: 'Genesis'),
      Brand(id: 39, nomeMarca: 'Chrysler'),
      Brand(id: 40, nomeMarca: 'Dodge'),
      Brand(id: 41, nomeMarca: 'Jeep'),
      Brand(id: 42, nomeMarca: 'Ram'),
      Brand(id: 43, nomeMarca: 'Buick'),
      Brand(id: 44, nomeMarca: 'Cadillac'),
      Brand(id: 45, nomeMarca: 'GMC'),
      Brand(id: 46, nomeMarca: 'Lincoln'),
      Brand(id: 47, nomeMarca: 'Mini'),
      Brand(id: 48, nomeMarca: 'Smart'),
      Brand(id: 49, nomeMarca: 'Saab'),
      Brand(id: 50, nomeMarca: 'Skoda'),
      Brand(id: 51, nomeMarca: 'Seat')
    ];

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
