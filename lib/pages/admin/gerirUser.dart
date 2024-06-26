import 'package:adrenture/pages/admin/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:adrenture/data/admin_data.dart';
import 'package:adrenture/widgets/smallCardAdmin.dart';
import 'gerirUser2.dart';
import 'package:adrenture/models/user.dart';

class GerirUser extends StatefulWidget {
  const GerirUser({super.key});

  @override
  _GerirUserState createState() => _GerirUserState();
}

class _GerirUserState extends State<GerirUser> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _getAllUsers();
  }

  void _getAllUsers() async {
    List<User> users = await AdminData.getAllUsers();
    setState(() {
      _users = users;
    });
  }

  void deleteUser(User user) async {
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
  }

  void editUser(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GerirUser2(user: user)),
    );
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> items = _users.map((user) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GerirUser2(user: user),
            ),
          );
        },
        child: SmallCustomCardAdmin(
          title: '${user.nomeUtilizador}',
          subtitle: user.dataAdesao.toString(),
          image: Image.asset(user.userImage, height: 120,),
          backgroundColor: const Color.fromRGBO(5, 157, 2, 70),
          icon: IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () => editUser(context, user),
          ), 
          icon2: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            onPressed: () => deleteUser(user), // Pass user object to deleteUser function
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
        title: Text('Manage Users'),
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