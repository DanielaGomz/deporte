import 'package:flutter/material.dart';
import 'screens/leggins_screen.dart';
import 'screens/pantalonetas_screen.dart';
import 'screens/camisas_screen.dart';
import 'screens/tops_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tienda de Deportes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de Deportes'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Leggins'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LegginsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Pantalonetas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PantalonetasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Camisas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CamisasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Tops'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
