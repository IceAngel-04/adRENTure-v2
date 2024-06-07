import 'package:adrenture/models/car.dart';
import 'package:adrenture/pages/home/carpage.dart';
import 'package:adrenture/pages/home/profile.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:adrenture/widgets/smallCard.dart';
import 'package:flutter/material.dart';

class GerirCarroPage extends StatelessWidget {
  const GerirCarroPage({super.key});


   void goBack(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarPage()));
    }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    GerirCarrosContent(title: 'Gerir Carros'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
        leading: IconButton(onPressed: () => goBack(context) , icon: Icon(Icons.arrow_back,color: Color(0xFF3C9096))),
        title: const Text('GERIR CARROS',
          style: TextStyle(
            color: Color(0xFF059D02),
            fontWeight: FontWeight.bold),
          ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class GerirCarrosContent extends StatelessWidget {
  final String title;

  const GerirCarrosContent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Car> carList = [
      carro1,
      carro2,
      carro3,
      carro4,
      carro5,
      carro6,
      carro7,
      carro8,
      carro9,
      carro10
    ];

    List<Widget> items = [
      ...carList.map((car) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarPage(carId: car.id),
              ),
            );
          },
          child: SmallCustomCard(
            title: '${car.marca} ${car.modelo}',
            subtitle: car.descricao,
            image: Image.asset(car.imagemPrincipal),
          ),
        );
      }),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
                  const Expanded(
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
                      // Implemente a ação do botão de filtro aqui
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
