import 'package:flutter/material.dart';
import 'package:adrenture/pages/home/carpage.dart';
import 'package:adrenture/pages/home/rentyourcar.dart';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/widgets/smallCard.dart';
import 'package:adrenture/models/user.dart';

/*void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    User user = User(); // Initialize your User object here
    return MaterialApp(
      home: HomePage(user: user),
      debugShowCheckedModeBanner: false,
    );
  }
}*/

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  List<Car> carList = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    // Initialize the car list
    carList = [
      carro1,
      carro2,
    ];

    _widgetOptions = <Widget>[
      HomePageContent(title: 'Carros em Destaque', user: widget.user, carList: carList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class HomePageContent extends StatefulWidget {
  final String title;
  final User user;
  final List<Car> carList;

  const HomePageContent({Key? key, required this.title, required this.user, required this.carList}) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
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
                      decoration: InputDecoration(
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