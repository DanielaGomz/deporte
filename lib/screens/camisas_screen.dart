import 'package:flutter/material.dart';

class CamisasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': './assets/images/camisa1.jpg',
      'description': 'Camisa para sentirte mas ligera.',
      'price': 50000,
    },
    {
      'image': './assets/images/camisa2.jpg',
      'description': 'Camisa deportiva de secado rápido.',
      'price': 45000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camisas')),
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
