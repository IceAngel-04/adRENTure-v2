import 'package:adrenture/data/admin_data.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/admin/dashboard.dart';
import 'package:adrenture/pages/admin/gerirCarro2.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/widgets/smallCardAdmin.dart';
import 'package:adrenture/data/car_data.dart';

class GerirCar extends StatefulWidget {
  final User user;
  const GerirCar({super.key, required this.user});

  @override
  _GerirCarState createState() => _GerirCarState();
}

class _GerirCarState extends State<GerirCar> {
  List<Car> _cars = [];

  @override
  void initState() {
    super.initState();
    _getAllCars();
  }

  void _getAllCars() async {
    try {
      List<Car> cars = await CarData.getAllCars();
      setState(() {
        _cars = cars;
      });
    } catch (e) {
      // Handle the exception, possibly set an error state
      print('Failed to load cars: $e');
    }
  }

    void goBack(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage(user: User.loggedUser!)),
    );
  }

void deleteCar(Car car) async {
  try {
    await AdminData.deleteCar(car);
    setState(() {
      _cars.removeWhere((c) => c.id == car.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Carro apagado com sucesso!')),
    );
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Falha ao apagar o carro. $error')),
    );
  }
}
  
  void editCar(BuildContext context, User user, Car car) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GerirCar2(car: car,user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = _cars.map((car) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GerirCar2(car: car, user: widget.user),
            ),
          );
        },
        child: SmallCustomCardAdmin(
          title: '${car.marca}',
          subtitle: car.modelo,
          image: Image.asset(car.imagemPrincipal, height: 120),
          backgroundColor: const Color.fromRGBO(5, 157, 2, 70),
          icon: IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GerirCar2(car: car, user: widget.user),
            ),
          );
            },
          ),
          icon2: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            onPressed: () => deleteCar(car),
          ),
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          onPressed: () => goBack(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096)),
        ),
        title: Text('Manage Cars'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Implement filter action here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView(
                children: items,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
