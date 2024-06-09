// ignore_for_file: file_names
import 'package:adrenture/models/user.dart';
import 'package:adrenture/pages/home/home.dart';
import 'package:adrenture/pages/home/userPage.dart';
import 'package:adrenture/pages/profile/profileEdit.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:adrenture/widgets/smallCardAdmin.dart';
import 'package:flutter/material.dart';

class GerirUserPage extends StatelessWidget {
  const GerirUserPage({super.key});

  void goBack(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavBarPage()),
    );
  }

  
    void editUser(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEditPage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GerirUsersPage extends StatefulWidget {
  const GerirUsersPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GerirUsersPageState createState() => _GerirUsersPageState();
}

class _GerirUsersPageState extends State<GerirUsersPage> {
  final int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    GerirUserContent(title: 'Gerir Users'),
  ];

  void goBack(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavBarPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096)),
        ),
        title: const Text(
          'GERIR User',
          style: TextStyle(
            color: Color(0xFF059D02),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class GerirUserContent extends StatelessWidget {
  final String title;


    void editUser(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEditPage()),
    );
  }

  const GerirUserContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<User> userList = [
      user1,
      user2,
      user3,
      user4,
      user5,
    ];
    List<Widget> items = userList.map((user) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(userID: user.id),
            ),
          );
        },
        child: SmallCustomCardAdmin
        (
          title: user.name,
          subtitle: user.dataAdesao.toString(),
          image: Image.asset(user.userImage, height: 120,),
          backgroundColor: const Color.fromRGBO(5, 157, 2, 70),
          icon: IconButton(icon: Icon(Icons.edit), color: Colors.white, onPressed: () => editUser(context)), 
          icon2: IconButton(icon: Icon(Icons.delete), color: Colors.white, onPressed: () {})
        ),
      );
    }).toList();

    return Scaffold(
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