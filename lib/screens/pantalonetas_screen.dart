import 'package:flutter/material.dart';

class PantalonetasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': './assets/images/pantaloneta1.jpg',
      'description': 'Pantaloneta deportiva para running.',
      'price': 30000,
    },
    {
      'image': './assets/images/pantaloneta2.jpg',
      'description': 'Pantaloneta para natación, resistente al agua.',
      'price': 35000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalonetas')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              // Cambiar Image.network a Image.asset para usar imágenes locales
              leading: Image.asset(
                product['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['description']),
              subtitle: Text('\$${product['price']}'),
            ),
          );
        },
      ),
    );
  }
}

