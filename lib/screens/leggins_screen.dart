import 'package:flutter/material.dart';

class LegginsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': './assets/images/leggins1.jpg',
      'description': 'Leggin deportivo cómodo y ajustado.',
      'price': 45000,
    },
    {
      'image': './assets/images/leggis2.jpg',
      'description': 'Leggin para yoga, suave y flexible.',
      'price': 40000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leggins')),
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
