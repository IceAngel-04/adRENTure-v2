import 'package:adrenture/pages/admin/gerirCarro.dart';
import 'package:adrenture/pages/admin/gerirUser.dart';
import 'package:adrenture/pages/admin/stats.dart';
import 'package:adrenture/pages/login/login.dart';
import 'package:adrenture/widgets/navbar.dart';
import 'package:flutter/material.dart';


 void gerirCarro(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GerirCarroPage()));
    }

   void gerirUsers(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GerirUsersPage()));
    }

    void verStats(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StatsPage()));
    }
    
    void logout(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()));
    }


   void goBack(BuildContext context){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarPage()));
    }

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
        leading: IconButton(onPressed: () => goBack(context) , icon: Icon(Icons.arrow_back,color: Color(0xFF3C9096))),
        title: const Text('ADMIN DASHBOARD',
          style: TextStyle(
            color: Color(0xFF059D02),
            fontWeight: FontWeight.bold),
          ),
      ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person)
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text(
                      'ADMIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.directions_car_outlined,color: Color(0xFF3C9096)),
              title: Text('Gerir Carros'),
              onTap: () => gerirCarro(context),
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined,color: Color(0xFF3C9096)),
              title: Text('Gerir Utilizadores'),
              onTap:  () => gerirUsers(context),
            ),
            ListTile(
              leading: Icon(Icons.query_stats_outlined,color: Color(0xFF3C9096)),
              title: Text('Ver estatisticas'),
              onTap: () => verStats(context),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Color(0xFF3C9096)),
              title: Text('Sair'),
              onTap: () => logout(context), 
            ),
          ],
        ),
      ),
    );
  }
}