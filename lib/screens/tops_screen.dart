import 'package:flutter/material.dart';

class TopsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'https://via.placeholder.com/150',
      'description': 'Top deportivo con soporte medio.',
      'price': 40000,
    },
    {
      'image': 'https://via.placeholder.com/150',
      'description': 'Top sin costuras, ideal para yoga.',
      'price': 35000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tops')),
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
