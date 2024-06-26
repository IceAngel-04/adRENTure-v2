import 'package:flutter/material.dart';
import 'package:adrenture/data/car_data.dart';
import 'package:adrenture/pages/home/carpage.dart';
import 'package:adrenture/pages/home/rentyourcar.dart';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/widgets/smallCard.dart';
import 'package:adrenture/models/user.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  List<Car> carList = [];
  bool _loading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchCars();
  }

  Future<void> _fetchCars() async {
    try {
      List<Car> cars = await CarData.getAllCars();
      setState(() {
        carList = cars;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _widgetOptions = <Widget>[
      HomePageContent(
        title: 'Carros em Destaque',
        user: widget.user,
        carList: carList,
        loading: _loading,
        error: _error,
      ),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}


class HomePageContent extends StatefulWidget {
  final String title;
  final User user;
  final List<Car> carList;
  final bool loading;
  final String error;

  const HomePageContent({
    Key? key,
    required this.title,
    required this.user,
    required this.carList,
    required this.loading,
    required this.error,
  }) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title, textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (widget.error.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title, textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Failed to load cars: ${widget.error}'),
        ),
      );
    }

    List<Widget> items = [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RentYourCarPage(user: widget.user),
            ),
          );
        },
        child: SmallCustomCard(
          title: 'Alugue já o seu Carro',
          subtitle: 'Alugue já o seu Carro para ganhar um dinheiro extra!!!',
          image: Image.asset(
            'assets/images/car.png',
            height: 120,
          ),
          backgroundColor: const Color(0xFF3C9096),
        ),
      ),
      ...widget.carList.map((car) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarPage(
                  carId: car.id,
                  car: car,
                ),
              ),
            );
          },
          child: SmallCustomCard(
            title: '${car.marca} ${car.modelo}',
            subtitle: car.descricao,
            image: Image.asset(car.imagemPrincipal, height: 120),
            backgroundColor: const Color.fromRGBO(5, 157, 2, 70),
          ),
        );
      }).toList(),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title, textAlign: TextAlign.center),
        centerTitle: true,
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
                      decoration: const InputDecoration(
                        hintText: 'Pesquisar',
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
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView(
                children: items,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
