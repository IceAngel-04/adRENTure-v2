import 'package:adrenture/data/car_data.dart';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/pages/home/carpage.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/data/admin_data.dart';
import 'package:adrenture/pages/home/userPage.dart';
import 'package:adrenture/widgets/smallCardAdmin.dart';
import 'gerirUser2.dart';
import 'package:adrenture/models/user.dart';

class GerirCar extends StatefulWidget {
  const GerirCar({super.key});

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
  } catch (error) {
    print('Failed to fetch cars: $error');
    // Handle error, show snackbar, retry option, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to fetch cars: $error')),
    );
  }
}

  /*void deleteUser(User user) async {
    try {
      await AdminData.deleteUser(user);
      setState(() {
        _users.removeWhere((u) => u.userID == user.userID);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Utilizador apagado com sucesso!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao apagar o utilizador. $error')),
      );
    }
  }*/

  /*void editUser(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GerirUser2(user: user)),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    List<Widget> items = _cars.map((cars) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarPage(car: cars, carId: cars.id,),
            ),
          );
        },
        child: SmallCustomCardAdmin(
          title: '${cars.marca}',
          subtitle: cars.modelo,
          image: Image.asset(cars.imagemPrincipal, height: 120,),
          backgroundColor: const Color.fromRGBO(5, 157, 2, 70),
          icon: IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () => {},
          ), 
          icon2: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            onPressed: () => {},
          ),
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
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
