import 'package:flutter/material.dart';
import 'package:mvvm_crud/models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Description: ${product.description}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
