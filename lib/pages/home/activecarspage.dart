import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/home/home.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/widgets/smallCard.dart';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/data/car_data.dart'; // Import your CarData file

class ActiveCarsPage extends StatefulWidget {
  final User user;
  const ActiveCarsPage({Key? key, required this.user}) : super(key: key);

  @override
  _ActiveCarsPageState createState() => _ActiveCarsPageState();
}

class _ActiveCarsPageState extends State<ActiveCarsPage> {
  bool showAllCars = false; // State to track toggle button
  List<Car> _carList = [];
  bool isLoading = true; // State to show loading indicator

  @override
  void initState() {
    super.initState();
    fetchBoughtCars(widget.user); // Initial fetch for currently rented user cars
  }

  Future<void> fetchAllCars() async {
    try {
      setState(() {
        isLoading = true;
      });
      final cars = await CarData.getAllCars();
      setState(() {
        _carList = cars;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching all cars: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchBoughtCars(User user) async {
    try {
      setState(() {
        isLoading = true;
      });
      final cars = await CarData.getBoughtUserCars();
      setState(() {
        _carList = cars;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching rented cars: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

    void goBack(BuildContext context){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BottomNavBarPage(user: widget.user)));
  }


  Future<void> fetchRentedUserCars(User user) async {
    try {
      final cars = await CarData.getAllCars();
      setState(() {
        _carList = cars;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching rented user cars: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
          IconButton(onPressed: () => goBack(context) , 
            icon: const Icon(Icons.arrow_back, color:Color(0xFF3C9096))),
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
                if (showAllCars) {
                  fetchBoughtCars(widget.user);
                } else {
                  fetchRentedUserCars(widget.user);
                }
              },
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: showAllCars ? _carList.length : (_carList.length > 5 ? 5 : _carList.length), // Display all or first 5 cars
              itemBuilder: (context, index) {
                final car = _carList[index];
                return SmallCustomCard(
                  title: '${car.marca} ${car.modelo}',
                  subtitle: 'Tempo Restante: ${DateTime.now().add(const Duration(hours: 24)).difference(DateTime.now()).inHours}:${DateTime.now().add(const Duration(hours: 24)).difference(DateTime.now()).inMinutes % 60}',
                  image: Image.asset(car.imagemPrincipal), // Use the car image from assets
                  backgroundColor: const Color.fromRGBO(5, 157, 2, 70),
                );
              },
            ),
    );
  }
}
